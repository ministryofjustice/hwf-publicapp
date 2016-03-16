class Probate < Base
  attribute :kase, Boolean
  attribute :deceased_name, String
  attribute :date_of_death, Date

  TIME_LIMIT_FOR_PROBATE = 20

  validates :kase, inclusion: { in: [true, false] }

  with_options if: :kase do
    validates :deceased_name, presence: true
  end

  with_options if: :validate_probate_date_of_death? do
    validates :date_of_death, date: {
      after_or_equal_to: TIME_LIMIT_FOR_PROBATE.years.ago,
      before: Time.zone.tomorrow,
      allow_blank: false
    }
  end

  private

  def validate_probate_date_of_death?
    validate_date? 'date_of_death' if kase?
  end

  def export_params
    {
      probate: kase,
      deceased_name: kase ? deceased_name : nil,
      date_of_death: kase ? date_of_death : nil
    }
  end
end
