source 'https://rubygems.org'

gem 'dotenv-rails', groups: [:development, :test] # this has to be here because of load order

gem 'rails', '~> 4.2.7'

gem 'config'
gem 'date_validator'
gem 'rest-client'
gem 'sentry-raven'
gem 'virtus'
gem 'zendesk_api'

gem 'govuk_elements_rails', '0.3.0'
gem 'govuk_frontend_toolkit', '4.7.0'
gem 'jquery-rails'
gem 'moj_template', '~> 0.23.2'
gem 'nokogiri', '~> 1.6.8'
gem 'sass-rails'
gem 'slim-rails'
gem 'uglifier', '3.0.0'
gem 'unicorn'

group :development, :test do
  gem 'factory_girl_rails'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.0'
  gem 'rubocop', '~>0.47.1', require: true
  gem 'rubocop-rspec', '~>1.10', require: false
end

group :development do
  gem 'foreman'
  gem 'launchy'
  gem 'spring'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'codeclimate-test-reporter', require: nil
  gem 'shoulda-matchers'
  gem 'timecop'
  gem 'webmock', require: false
end
