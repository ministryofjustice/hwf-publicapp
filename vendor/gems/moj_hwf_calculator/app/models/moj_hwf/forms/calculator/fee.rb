module MojHwf
  module Forms
    module Calculator
      class Fee < Base
        attribute :fee, Float

        def type
          :fee
        end

        private

        def export_params
          {
              fee: fee
          }
        end
      end
    end
  end
end