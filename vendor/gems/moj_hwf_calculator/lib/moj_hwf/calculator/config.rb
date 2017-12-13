require 'singleton'
module MojHwf
  module Calculator
    class Config
      include Singleton

      attr_accessor :api_root
    end
  end
end