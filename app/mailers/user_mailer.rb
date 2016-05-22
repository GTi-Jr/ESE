# -*- encoding : utf-8 -*-
class UserMailer < ActionMailer::Base
  include SendGrid if Rails.env.production?
  default from: EMAIL

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_send.subject
  #
  def password_send (user)
    @user = user

    mail to: @user.email, subject: 'Sua senha de acesso =D'
  end

  def lost_password (user)
    @user = user

    mail to: @user.email, subject: 'Maxo a tua nova senha =P'
  end
end
