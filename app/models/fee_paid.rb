class FeePaid
  include Virtus.model(nullify_blank: true)
  include ActiveModel::Model

  attribute :answer, Boolean

  validates :answer, inclusion: { in: [true, false] }
end
