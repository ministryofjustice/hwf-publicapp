module Forms
  class SavingsAndInvestmentExtra < Base
    attribute :over_61, Boolean
    attribute :amount, Integer

    validates :over_61, inclusion: { in: [true, false] }
    validates :amount, presence: true, unless: :over_61?

    private

    def export_params
      {}
    end
  end
end
