class FeePaid < Base
  attribute :answer, Boolean

  validates :answer, inclusion: { in: [true, false] }
end
