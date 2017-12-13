module MojHwf
  module Forms
    module Calculator
      class BenefitsReceived < Base
        attribute :benefits_received, Float

        def type
          :benefits_received
        end

        private

        def export_params
          {
              benefits_received: benefits_received
          }
        end
      end
    end
  end
end