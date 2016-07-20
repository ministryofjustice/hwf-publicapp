module Forms
  class IncomeRange < BaseRange
    private

    def export_params
      case choice
      when :less
        { income_min_threshold_exceeded: false }
      when :between
        { income_min_threshold_exceeded: true, income_max_threshold_exceeded: false }
      when :more
        { income_min_threshold_exceeded: true, income_max_threshold_exceeded: true }
      else
        {}
      end
    end
  end
end
