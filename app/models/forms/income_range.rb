module Forms
  class IncomeRange < BaseRange
    private

    def min_threshold_name
      :income_min_threshold_exceeded
    end

    def max_threshold_name
      :income_max_threshold_exceeded
    end
  end
end
