class Dependent < Base
  attribute :children, Boolean
  attribute :children_number, Integer

  validates :children, inclusion: { in: [true, false] }

  with_options if: :children? do
    validates :children_number, numericality: true
  end
end
