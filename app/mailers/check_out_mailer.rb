class CheckOutMailer < ActionMailer::Base
  default from: "gtiengenhariajr@gmail.com"

  def finish_buy (user, order)
    @user = user
    @order = order

    mail to: @user.email, subject: 'Compra finalizada'
  end

  def confirm_buy (user)
    @user = user

    mail to: @user.email, subject: 'Compra confirmada'
  end
end
