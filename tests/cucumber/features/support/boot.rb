# frozen_string_literal: true
require 'pry'
require 'site_prism'
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'capybara-screenshot/cucumber'

require File.dirname(__FILE__) + '/../support/capybara_driver_helper'
require File.dirname(__FILE__) + '/../support/site_prism_config'