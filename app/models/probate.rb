class Probate < Base
  attribute :kase, Boolean

  validates :kase, inclusion: { in: [true, false] }
end
