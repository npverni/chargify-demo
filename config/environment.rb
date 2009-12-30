# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem 'chargify_api_ares',
    :source  => 'http://gemcutter.org'
  config.gem "clearance",
    :lib     => 'clearance',
    :source  => 'http://gemcutter.org',
    :version => '0.8.3'

  config.time_zone = 'UTC'  
end

DO_NOT_REPLY = "donotreply@haymail.heroku.com"