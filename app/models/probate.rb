class Probate < Base
  attribute :probate_case, Boolean

  validates :probate_case, inclusion: { in: [true, false] }
end
