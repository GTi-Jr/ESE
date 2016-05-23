# -*- encoding : utf-8 -*-
# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '25',
  :authentication => :plain,
  :user_name      => ENV['SENGRID_USERNAME'],
  :password       => ENV['SENGRID_PASSWORD'],
  :domain         => ENV['SITE_URL'],
  :enable_starttls_auto => true
}

ActionMailer::Base.delivery_method = :smtp
