require "slim-rails"
require "moj_hwf/calculator/engine"
require "moj_hwf/calculator/config"

module MojHwf
  module Calculator
    def self.config
      yield Config.instance if block_given?
      Config.instance
    end

  end
end
