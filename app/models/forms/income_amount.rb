module Forms
  class IncomeAmount < Base
    attribute :amount, Integer

    validates :amount,
      presence: true, numericality: {
        allow_blank: true,
        less_than: 100000,
        greater_than_or_equal_to: 0
      }
  end
end
