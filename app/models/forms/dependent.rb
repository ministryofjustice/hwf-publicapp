module Forms
  class Dependent < Base
    attribute :children, Boolean
    attribute :children_number, Integer

    validates :children, inclusion: { in: [true, false] }
    validates :children_number,
      presence: true, numericality: { allow_blank: true, less_than: 100 }, if: :children?

    private

    def export_params
      {
        children: children ? children_number : 0
      }
    end
  end
end
