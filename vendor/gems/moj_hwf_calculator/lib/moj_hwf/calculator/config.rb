require 'singleton'
module MojHwf
  module Calculator
    class Config
      include Singleton

      attr_accessor :api_root, :api_token
    end
  end
end