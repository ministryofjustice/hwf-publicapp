# IMPORTANT: This file is generated by cucumber-rails - edit at your own peril.
# It is recommended to regenerate this file in the future when you upgrade to a
# newer version of cucumber-rails. Consider adding your own code to a new file
# instead of editing this one. Cucumber will automatically load all features/**/*.rb
# files.

require 'cucumber/rails'
require 'capybara/poltergeist'
require 'capybara-screenshot/cucumber'
require 'net/http'

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
$zap_proxy = "localhost"
$zap_proxy_port = 8095

#Below lines are our driver profile settings to reach internet through a proxy
#You can set security=true as environment variable or declare it on command window
if ENV['security'] == "true"
  Capybara.register_driver :selenium do |app|
    profile = Selenium::WebDriver::Firefox::Profile.new
    profile["network.proxy.type"] = 1
    profile["network.proxy.http"] = $zap_proxy
    profile["network.proxy.http_port"] = $zap_proxy_port
    Capybara::Selenium::Driver.new(app, :profile => profile)
  end
end

#Screenshot operations
$screenshot_counter = 0
Capybara.save_and_open_page_path = File.expand_path(File.join(File.dirname(__FILE__), "../screenshots/"))

#Capybara settings
Capybara.run_server = false
Capybara.default_driver = :selenium #Use Selenium as Driver
Capybara.javascript_driver = :selenium #Use Selenium as JS Driver
Capybara.default_selector = :css #Defatult Selector methos is CSS
Capybara.default_max_wait_time = 15 #Wait time is 15 seconds
Capybara.ignore_hidden_elements = false #Do not ignore hidden elements
Capybara.exact = true #All is expressions match exactly (Exact Match/Ignores substring matches)
Capybara.app_host = 'http://www.akakce.com' #Our test site
World(Capybara::DSL)

ENV['NO_PROXY'] = ENV['no_proxy'] = '127.0.0.1'
if ENV['APP_HOST']
  Capybara.app_host = ENV['APP_HOST']
  if Capybara.app_host.chars.last != '/'
    Capybara.app_host += '/'
  end
end

FIRST_ACCOUNT_SUFFIX = 5001
$delete_enabled = true
$environment = 'qa'
