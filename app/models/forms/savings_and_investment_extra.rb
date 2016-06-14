module Forms
  class SavingsAndInvestmentExtra < Base
    attribute :over_61, Boolean
    attribute :amount, Integer

    validates :over_61, inclusion: { in: [true, false] }
    validates :amount, presence: true, if: 'over_61? == false'

    private

    def export_params
      { over_61: over_61 }.merge(amount_param)
    end

    def amount_param
      !over_61? && amount.present? ? { amount: amount } : {}
    end
  end
end
