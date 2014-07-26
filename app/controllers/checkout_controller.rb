class CheckoutController < ApplicationController
  before_action :check_and_redirect

  def new
    order
    if @total == 0
      redirect_to "/index", :alert => "Você ainda não tem itens para ser comprados"
    end

    session[:price] = (@total + @total/20)
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
        amount: session[:price]
      }

    response = payment.register
    finish_bought

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

  private
  def finish_bought
    CheckOutMailer.finish_buy(current_user, order).deliver
  end
end