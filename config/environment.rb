# Be sure to restart your server when you modify this file

# Uncomment below to force Rails into production mode when
# you don't control web/app server and can't set it the proper way
# ENV['RAILS_ENV'] ||= 'production'

# Specifies gem version of Rails to use when vendor/rails is not present
# RAILS_GEM_VERSION = '2.0.2' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :address          => "mail.hunterartsnetwork.org",
    :port             => 587,
    :domain           => "www.hunterartsnetwork.org",
    :authentication   => :login,
    :user_name        => "support@hunterartsnetwork.org",
    :password         => "ffg67rTTr5"
  }
  
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default_charset = "utf-8"

  # Your secret key for verifying cookie session data integrity.
  # If you change this key, all old sessions will become invalid!
  # Make sure the secret is at least 30 characters and all random, 
  # no regular words or you'll be exposed to dictionary attacks.
  config.action_controller.session = {
    :session_key => '_hunterArts_session',
    :secret      => 'f2e215ac5b4sdsd63dd57d98321351a49f1135839e'
   }

  # Use the database for sessions instead of the cookie-based default,
  # which shouldn't be used to store highly confidential information
  # (create the session table with 'rake db:sessions:create')
  config.action_controller.session_store = :active_record_store

end

## require gems or whatever
require 'will_paginate'