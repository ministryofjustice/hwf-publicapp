module Forms
  module Calculator
    class TotalSavings < Base
      attribute :total_savings, Float

      def type
        :total_savings
      end

      private

      def export_params
        {
          total_savings: total_savings
        }
      end
    end
  end
end
