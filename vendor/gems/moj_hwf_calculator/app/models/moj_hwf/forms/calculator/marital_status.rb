module MojHwf
  module Forms
    module Calculator
      class MaritalStatus < Base
        attribute :marital_status, String

        validates :marital_status, inclusion: { in: %w[single sharing_income] }, allow_blank: true

        def type
          :marital_status
        end

        private

        def export_params
          {
              marital_status: marital_status
          }
        end
      end
    end
  end
end