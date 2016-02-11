class Fee < Base
  attribute :paid, Boolean

  validates :paid, inclusion: { in: [true, false] }
end
