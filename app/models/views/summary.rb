module Views
  class Summary < SimpleDelegator
    # TODO: Use a different way of including helpers
    include ActionView::Helpers::NumberHelper

    def refund_text
      message = I18n.t("fee_paid_#{refund}", scope: 'summary')
      "#{message}#{payment_date}"
    end

    def form_name
      __getobj__.form_name ? __getobj__.form_name : '—'
    end

    def savings
      scope = 'questions.savings_and_investment'

      if !online_application.min_threshold_exceeded?
        I18n.t('less', scope: scope)
      elsif online_application.max_threshold_exceeded?
        I18n.t('more', scope: scope)
      elsif online_application.over_61?
        I18n.t('between', scope: scope)
      else
        number_to_currency(online_application.amount, precision: 0, unit: '£')
      end
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

    def online_application
      __getobj__
    end

    def payment_date
      ", on #{date_fee_paid}" if refund
    end
  end
end
