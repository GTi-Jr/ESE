# -*- encoding : utf-8 -*-
require File.expand_path('../boot', __FILE__)

require 'rails/all'



# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EcejPro
  class Application < Rails::Application

  	ActionMailer::Base.delivery_method = :smtp
  	
  end
end
