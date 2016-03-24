module Forms
class Dependent < Base
  attribute :children, Boolean
  attribute :children_number, Integer

  validates :children, inclusion: { in: [true, false] }

  with_options if: :children? do
    validates :children_number, presence: true, numericality: { allow_blank: true }
  end

  private

  def export_params
    {
      children: children ? children_number : 0
    }
  end
end
end
