module Forms
  class ApplicantAddress < Base
    attribute :address, String
    attribute :postcode, String

    validates :address, presence: true, length: { maximum: 100 }
    validates :postcode, presence: true, length: { maximum: 10 }

    private

    def export_params
      {
        address: address,
        postcode: postcode
      }
    end
  end
end
