module Forms
  class NationalInsurance < Base
    include ActiveModel::Validations::Callbacks

    attribute :number, String

    NI_NUMBER_REGEXP = /\A(?!BG|GB|NK|KN|TN|NT|ZZ)[ABCEGHJ-PRSTW-Z][ABCEGHJ-NPRSTW-Z]\d{6}[A-D]\z/

    validates :number, format: { with: NI_NUMBER_REGEXP }, allow_blank: true
    validates :number, presence: true

    before_validation :format_number

    private

    def format_number
      unless number.nil?
        number.upcase!
      end
    end

    def export_params
      {
        ni_number: number
      }
    end
  end
end
