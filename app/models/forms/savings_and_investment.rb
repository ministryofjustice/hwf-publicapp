module Forms
  class SavingsAndInvestment < BaseRange
    private

    def export_params
      case choice
      when :less
        { min_threshold_exceeded: false }
      when :between
        { min_threshold_exceeded: true, max_threshold_exceeded: false }
      when :more
        { min_threshold_exceeded: true, max_threshold_exceeded: true }
      else
        {}
      end
    end
  end
end
