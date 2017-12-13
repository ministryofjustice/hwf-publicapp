module MojHwf
  module Calculator
    class Engine < ::Rails::Engine
      isolate_namespace ::MojHwf::Calculator
    end
  end
end
