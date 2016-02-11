class Benefit < Base
  attribute :on_benefits, Boolean

  validates :on_benefits, inclusion: { in: [true, false] }
end
