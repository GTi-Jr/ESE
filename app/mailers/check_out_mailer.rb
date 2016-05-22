# -*- encoding : utf-8 -*-
class CheckOutMailer < ActionMailer::Base
  include SendGrid if Rails.env.production?
  default from: EMAIL

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
