class Claim < Base
  attribute :number, Boolean

  validates :number, inclusion: { in: [true, false] }
end
