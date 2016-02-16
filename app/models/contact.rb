class Contact < Base
  attribute :email_option, Boolean
  attribute :email, String
  attribute :phone_option, Boolean
  attribute :phone, String
  attribute :post_option, Boolean

  validates :email_option, inclusion: { in: [true, false] }
  validates :phone_option, inclusion: { in: [true, false] }
  validates :post_option, inclusion: { in: [true, false] }

  with_options if: :email_option? do
    email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates :email, format: { with: email_regex, allow_nil: false }
  end

  with_options if: :phone_option? do
    validates :phone, presence: true
  end
end
