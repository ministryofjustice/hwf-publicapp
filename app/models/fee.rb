class Fee < Base
  attribute :paid, Boolean
  attribute :date_paid, Date

  validates :paid, inclusion: { in: [true, false] }

  with_options if: :validate_fee_date_paid? do
    validates :date_paid, date: {
      after_or_equal_to: Time.zone.today - 3.months,
      before_or_equal_to: Time.zone.today,
      allow_blank: false
    }
  end

  private

  def validate_fee_date_paid?
    validate_date? 'date_paid' if paid?
  end

  def export_params
    {
      refund: paid,
      date_fee_paid: paid ? date_paid : nil
    }
  end
end
