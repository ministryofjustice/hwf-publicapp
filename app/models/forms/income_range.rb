module Forms
  class IncomeRange < Base
    attribute :choice, Symbol

    validates :choice, inclusion: { in: %i[less between more] }

    private

    def export_params
      {}
    end
  end
end
