module Forms
  class Claim < Base
    attribute :number, Boolean
    attribute :identifier, String

    validates :number, inclusion: { in: [true, false] }

    with_options if: :number do
      validates :identifier, presence: true
    end

    private

    def export_params
      {
        case_number: number ? identifier : nil
      }
    end
  end
end
