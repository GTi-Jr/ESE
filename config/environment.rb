# -*- encoding : utf-8 -*-
# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['SENGRID_USERNAME'],
  :password       => ENV['SENGRID_PASSWORD'],
  :domain         => 'heroku.com',
  :enable_starttls_auto => true
}

p '///////////////////////////////////////////////////////////////////'
p 'environment.rb'
p "user: #{ENV['SENDGRID_USERNAME']}"
p "PASSWORD: #{ENV['SENDGRID_PASSWORD']}"
p '///////////////////////////////////////////////////////////////////'
