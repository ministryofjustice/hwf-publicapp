module Forms
  module Calculator
    class MaritalStatus < Base
      attribute :marital_status, String

      validates :marital_status, inclusion: { in: ['single', 'sharing_income'] }

      private

      def export_params
        {
            marital_status: marital_status
        }
      end
    end
  end
end
