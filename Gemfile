source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.1'
gem 'govuk_frontend_toolkit', git: "https://github.com/alphagov/govuk_frontend_toolkit_gem.git", submodules: true
gem 'govuk_elements_rails', git: 'https://github.com/ministryofjustice/govuk_elements_rails.git', submodules: true
gem 'moj_template', '~> 0.23.2'
gem 'date_validator'
gem 'jwt'
gem 'config'
# Use SCSS for stylesheets
gem 'sass-rails', '5.0.4'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring', group: :development

# Use unicorn as the app server
gem 'unicorn'

# Use debugger
# gem 'debugger', group: [:development, :test]

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'rubocop', '~>0.37.2', require: true
  gem 'rubocop-rspec', require: false
  gem 'pry'
end

gem 'web-console', group: :development
gem 'launchy', group: :development

group :test do
  gem 'codeclimate-test-reporter', require: nil
  gem 'capybara'
end

gem 'slim-rails'
gem 'virtus'
