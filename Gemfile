source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'dotenv-rails', groups: [:development, :test] # this has to be here because of load order
gem 'application_insights', '~> 0.5.6'

gem 'rails', '~> 6.0'

gem 'bootsnap', require: false
gem 'config'
gem 'date_validator'
gem 'rest-client'
gem 'sentry-raven', '~> 2.13'
gem 'virtus'
gem 'zendesk_api', '~> 1.24'

# Azure key vault secrets to ENV variables
gem 'azure_env_secrets', github: 'ministryofjustice/azure_env_secrets', tag: 'v0.1.3'

gem 'jquery-rails'
gem 'nokogiri'
gem 'sass-rails'
gem 'slim-rails'
gem 'uglifier', '3.0.0'
gem 'unicorn'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'parallel_tests'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 4.0'
  gem 'rubocop', '0.76.0', require: false
  gem 'rubocop-rspec', '1.36.0', require: false
end

group :development do
  gem 'foreman'
  gem 'launchy'
  gem 'spring'
  gem 'web-console'
  gem 'listen'
end

group :test do
  gem 'capybara', '~> 2.7'
  gem 'capybara-screenshot'
  gem 'chromedriver-helper', '~> 1.1'
  gem 'codeclimate-test-reporter', require: nil
  gem 'cucumber-rails', '~> 1.5', require: false
  gem 'geckodriver-helper', '~> 0.23.0'
  gem 'poltergeist', '1.15.0'
  gem 'rspec_junit_formatter', '~> 0.4.1'
  gem 'rails-controller-testing'
  gem 'selenium-webdriver', '~> 3.141'
  gem 'shoulda-matchers'
  gem 'site_prism', '~> 2.9'
  gem 'timecop'
  gem 'webmock', require: false
end
