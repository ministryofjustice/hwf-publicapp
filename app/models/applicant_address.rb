class ApplicantAddress < Base
  attribute :address, String
  attribute :postcode, String

  validates :address, presence: true
  validates :postcode, presence: true
end
