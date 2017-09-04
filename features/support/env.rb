# IMPORTANT: This file is generated by cucumber-rails - edit at your own peril.
# It is recommended to regenerate this file in the future when you upgrade to a
# newer version of cucumber-rails. Consider adding your own code to a new file
# instead of editing this one. Cucumber will automatically load all features/**/*.rb
# files.

require 'capybara/accessible'
require 'cucumber/rails'
require 'capybara/dsl'
require 'capybara/poltergeist'
require 'capybara-screenshot/cucumber'
require 'rest-client'
require 'selenium-webdriver'


Dir[File.dirname(__FILE__) + '/page_objects/**/*.rb'].each { |f| require f }

# Capybara defaults to CSS3 selectors rather than XPath.
# If you'd prefer to use XPath, just uncomment this line and adjust any
# selectors in your step definitions to use the XPath syntax.
# Capybara.default_selector = :xpath

# By default, any exception happening in your Rails application will bubble up
# to Cucumber so that your scenario will fail. This is a different from how
# your application behaves in the production environment, where an error page will
# be rendered instead.
#
# Sometimes we want to override this default behaviour and allow Rails to rescue
# exceptions and display an error page (just like when the app is running in production).
# Typical scenarios where you want to do this is when you test your error pages.
# There are two ways to allow Rails to rescue exceptions:
#
# 1) Tag your scenario (or feature) with @allow-rescue
#
# 2) Set the value below to true. Beware that doing this globally is not
# recommended as it will mask a lot of errors for you!
#
ActionController::Base.allow_rescue = false

#Define global variables
ENV['zap_proxy'] = "localhost"
ENV['zap_proxy_port'] = '8099'

#Below lines are our driver profile settings to reach internet through a proxy
#You can set security=true as environment variable or declare it on command window
if ENV['security'] == "true"
  Capybara.register_driver :selenium do |app|
    profile = Selenium::WebDriver::Firefox::Profile.new
    profile["network.proxy.type"] = 1
    profile["network.proxy.http"] = ENV['zap_proxy']
    profile["network.proxy.http_port"] = ENV['zap_proxy_port']
    Capybara::Selenium::Driver.new(app, :profile => profile)
  end
end

ENV['NO_PROXY'] = ENV['no_proxy'] = '127.0.0.1'
if ENV['APP_HOST']
  Capybara.app_host = ENV['APP_HOST']
  if Capybara.app_host.chars.last != '/'
    Capybara.app_host += '/'
  end
end
