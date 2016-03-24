module Forms
  class SavingsAndInvestment < Base
    attribute :less_than_limit, Boolean

    validates :less_than_limit, inclusion: { in: [true, false] }

    private

    def export_params
      {
        threshold_exceeded: !less_than_limit
      }
    end
  end
end
