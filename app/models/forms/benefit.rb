module Forms
  class Benefit < Base
    attribute :on_benefits, Boolean

    validates :on_benefits, inclusion: { in: [true, false] }

    private

    def export_params
      {
        benefits: on_benefits
      }
    end
  end
end
