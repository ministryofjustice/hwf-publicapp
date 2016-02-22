class Fee < Base
  attribute :paid, Boolean
  attribute :date_paid, Date

  validates :paid, inclusion: { in: [true, false] }

  with_options if: :validate_date_fee_paid? do
    validates :date_paid, date: {
      after_or_equal_to: Time.zone.today - 3.months,
      before_or_equal_to: Time.zone.today,
      allow_blank: false
    }
  end

  private

  def validate_date_fee_paid?
    if paid?
      if date_paid.is_a?(Date) || date_paid.is_a?(Time)
        true
      else
        failure_reason = date_paid.present? ? :not_a_date : :blank
        clear_and_set_error(failure_reason)
        false
      end
    end
  end

  def clear_and_set_error(validation)
    errors[:date_paid].clear
    errors.add(:date_paid, validation)
  end
end
