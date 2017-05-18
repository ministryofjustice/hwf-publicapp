module Forms
  class Fee < Base
    attribute :paid, Boolean
    attribute :date_paid, Date

    validates :paid, inclusion: { in: [true, false] }

    with_options if: :validate_fee_date_paid? do
      validates :date_paid, date: {
        after_or_equal_to: :min_date,
        before_or_equal_to: :max_date,
        allow_blank: false
      }
    end

    private

    def min_date
      Time.zone.today - 3.months
    end

    def max_date
      Time.zone.today
    end

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
end
