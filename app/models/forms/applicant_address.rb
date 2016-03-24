module Forms
class ApplicantAddress < Base
  attribute :address, String
  attribute :postcode, String

  validates :address, presence: true
  validates :postcode, presence: true

  private

  def export_params
    {
      address: address,
      postcode: postcode
    }
  end
end
end
