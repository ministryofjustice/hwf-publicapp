class SavingsAndInvestment < Base
  attribute :less_than_limit, Boolean

  validates :less_than_limit, inclusion: { in: [true, false] }
end
