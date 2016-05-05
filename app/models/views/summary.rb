module Views
  class Summary < SimpleDelegator
    def refund_text
      message = I18n.t("fee_paid_#{refund}", scope: 'summary')
      "#{message}#{payment_date}"
    end

    def children_text
      unless children.nil?
        children > 0 ? children.to_s : I18n.t('summary.children_false')
      end
    end

    def case_number?
      case_number.present?
    end

    def full_address
      [address, postcode].join(' ')
    end

    private

    def payment_date
      ", on #{date_fee_paid}" if refund
    end
  end
end
