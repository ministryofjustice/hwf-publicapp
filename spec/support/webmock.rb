# frozen_string_literal: true
require 'webmock/rspec'

RSpec.configure do |config|
  config.before(:all) do
    WebMock.disable_net_connect!(allow: %w[codeclimate.com])
  end
end
