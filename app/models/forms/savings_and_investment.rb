module Forms
  class SavingsAndInvestment < Base
    attribute :choice, Symbol

    validates :choice, inclusion: { in: %i[less between more] }

    private

    def export_params
      {
        threshold_exceeded: choice != :less
      }
    end
  end
end
