class Probate < Base
  attribute :kase, Boolean
  attribute :deceased_name, String
  attribute :date_of_death, Date

  TIME_LIMIT_FOR_PROBATE = 20

  validates :kase, inclusion: { in: [true, false] }

  with_options if: :kase do
    validates :deceased_name, presence: true
  end

  with_options if: :validate_date_of_death? do
    validates :date_of_death, date: {
      after_or_equal_to: TIME_LIMIT_FOR_PROBATE.years.ago,
      before: Time.zone.tomorrow,
      allow_blank: false
    }
  end

  private

  def validate_date_of_death?
    if kase?
      if date_of_death.is_a?(Date) || date_of_death.is_a?(Time)
        true
      else
        failure_reason = date_of_death.present? ? :not_a_date : :blank
        clear_and_set_error(failure_reason)
        false
      end
    end
  end

  def clear_and_set_error(validation)
    errors[:date_of_death].clear
    errors.add(:date_of_death, validation)
  end
end
