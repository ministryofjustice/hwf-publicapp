require 'webmock/rspec'

RSpec.configure do |config|
  config.before(:all) do
    WebMock.disable_net_connect!(allow: %w[codeclimate.com 127.0.0.1])
  end
end
