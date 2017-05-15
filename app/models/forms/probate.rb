# frozen_string_literal: true
module Forms
  class Probate < Base
    attribute :kase, Boolean
    attribute :deceased_name, String
    attribute :date_of_death, Date

    TIME_LIMIT_FOR_PROBATE = 20

    validates :kase, inclusion: { in: [true, false] }
    validates :deceased_name, presence: true, length: { maximum: 99 }, if: :kase?

    with_options if: :validate_probate_date_of_death? do
      validates :date_of_death, date: {
        after_or_equal_to: :time_limit_probate,
        before: :tomorrow,
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

    def tomorrow
      Time.zone.tomorrow
    end

    def time_limit_probate
      TIME_LIMIT_FOR_PROBATE.years.ago
    end
  end
end
