module Forms
  class SavingsAndInvestment < Base
    attribute :choice, Symbol

    validates :choice, inclusion: { in: %i[less between more] }

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
