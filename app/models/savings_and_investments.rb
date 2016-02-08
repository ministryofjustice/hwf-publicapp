class SavingsAndInvestments
  include Virtus.model(nullify_blank: true)
  include ActiveModel::Model

  attribute :less_than_limit, Boolean

  validates :less_than_limit, inclusion: { in: [true, false] }
end
