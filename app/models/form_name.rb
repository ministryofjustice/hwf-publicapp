class FormName < Base
  attribute :identifier, String

  validates :identifier, presence: true
end
