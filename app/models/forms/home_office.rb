module Forms
  class HomeOffice < Base
    include ActiveModel::Validations::Callbacks

    attribute :ho_number, String
    attribute :ni_number, String

    validates :ho_number, presence: true, if: ->(form) { form.ni_number.blank? }

    before_validation :format_number

    private

    def format_number
      unless ho_number.nil?
        ho_number.upcase!
        ho_number.delete!(' ')
      end
    end

    def export_params
      {
        ho_number: ho_number
      }
    end
  end
end
