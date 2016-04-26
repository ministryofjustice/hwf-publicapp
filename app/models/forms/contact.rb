module Forms
  class Contact < Base
    attribute :email, String
    attribute :feedback_opt_in, Boolean, default: false

    email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates :email,
      format: { with: email_regex, allow_nil: true, allow_blank: true },
      length: { maximum: 100 }
    validates :feedback_opt_in, inclusion: { in: [true, false] }

    private

    def export_params
      {
        email_contact: email.present?,
        email_address: email,
        phone_contact: false,
        post_contact: false,
        feedback_opt_in: feedback_opt_in
      }
    end
  end
end
