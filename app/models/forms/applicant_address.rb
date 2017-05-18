module Forms
  class ApplicantAddress < Base
    attribute :address, String
    attribute :postcode, String

    validates :address, presence: true, length: { maximum: 99 }
    validates :postcode, presence: true, length: { maximum: 8 }

    private

    def export_params
      {
        address: address,
        postcode: postcode
      }
    end
  end
end
