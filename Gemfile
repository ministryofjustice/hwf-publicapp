source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'dotenv-rails', groups: [:development, :test] # this has to be here because of load order
gem 'azure_env_secrets', github: 'ministryofjustice/azure_env_secrets', tag: 'v0.1.3'
gem 'rails', '~> 6.0'

gem 'application_insights', '~> 0.5.6'
gem 'bootsnap', require: false
gem 'config'
gem 'date_validator', '0.9.0'
gem 'jquery-rails'
gem 'nokogiri'
gem 'rest-client'
gem 'sass-rails'
gem 'sentry-raven'
gem 'slim-rails'
gem 'uglifier'
gem 'puma', '~> 4.3'
gem 'virtus'
gem 'zendesk_api', '~> 1.24'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'parallel_tests'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'rubocop', '0.76.0', require: false
  gem 'rubocop-rspec', '1.36.0', require: false
end

group :development do
  gem 'foreman'
  gem 'launchy'
  gem 'listen'
  gem 'spring'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'chromedriver-helper', '~> 1.1'
  gem 'codeclimate-test-reporter', require: nil
  gem 'cucumber-rails', require: false
  gem 'geckodriver-helper', '~> 0.23.0'
  gem 'poltergeist', '1.15.0'
  gem 'rails-controller-testing'
  gem 'rspec_junit_formatter', '~> 0.4.1'
  gem 'selenium-webdriver', '~> 3.141'
  gem 'shoulda-matchers'
  gem 'site_prism'
  gem 'timecop'
  gem 'webmock', require: false
end
