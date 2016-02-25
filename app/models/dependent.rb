class Dependent < Base
  attribute :children, Boolean

  validates :children, inclusion: { in: [true, false] }
end
