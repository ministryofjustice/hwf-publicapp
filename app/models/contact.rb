class Contact < Base
  attribute :email_option, Boolean
  attribute :email, String

  validates :email_option, inclusion: { in: [true, false] }

  with_options if: :email_option? do
    email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates :email, format: { with: email_regex, allow_nil: false }
  end

end
