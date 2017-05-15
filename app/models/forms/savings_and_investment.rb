# frozen_string_literal: true
module Forms
  class SavingsAndInvestment < BaseRange
    private

    def min_threshold_name
      :min_threshold_exceeded
    end

    def max_threshold_name
      :max_threshold_exceeded
    end
  end
end
