class CheckoutController < ApplicationController
  def new
    @order = []
    @total = 0

    current_user.extras.each do |extra|
      @order << extra
    end

    current_user.lectures.each do |lecture|
      @order << lecture
    end

    current_user.courses.each do |course|
      @order << course
    end

    current_user.teches.each do |tech|
      @order << tech
    end

    @order.each do |o|
      @total = @total + o.price
    end

    if @total == 0
      redirect_to "/index", :alert => "Você ainda não tem itens para ser comprados"
    end
  end


  def create
    # O modo como você irá armazenar os produtos que estão sendo comprados
    # depende de você. Neste caso, temos um modelo Order que referência os
    # produtos que estão sendo comprados.
    payment = PagSeguro::PaymentRequest.new(email: 'gtiengenhariajr@gmail.com', token: 'C118B1F4701C48F594D97903237839B0')
    payment.reference = 'gtiengenhariajr'
    payment.notification_url = "localhost:3000"
    payment.redirect_url = "localhost:3000"

      payment.items << {
        id: 1,
        description: "Pagamento do Evento - SEC",
        amount: params[:price]
      }

    response = payment.register

    # Caso o processo de checkout tenha dado errado, lança uma exceção.
    # Assim, um serviço de rastreamento de exceções ou até mesmo a gem
    # exception_notification poderá notificar sobre o ocorrido.
    #
    # Se estiver tudo certo, redireciona o comprador para o PagSeguro.
    if response.errors.any?
      raise response.errors.join("\n")
    else
      redirect_to response.url
    end
  end
end