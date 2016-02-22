module Views
  class Summary

    ATTRIBUTES = [
      { marital_status: 'married' },
      { savings_and_investment: 'less_than_limit' },
      { benefit: 'on_benefits' },
      { fee: 'paid' },
      { fee: 'date_paid' },
      { probate: 'kase' },
      { probate: 'deceased_name' },
      { probate: 'date_of_death' },
      { claim: 'number' },
      { form_name: 'identifier' },
      { national_insurance: 'number' },
      { personal_detail: 'title' },
      { personal_detail: 'first_name' },
      { personal_detail: 'last_name' },
      { applicant_address: 'address' },
      { applicant_address: 'postcode' },
      { contact: 'email' }
    ].freeze

    ATTRIBUTES.each do |hash|
      hash.each do |key, value|
        define_method("#{key}_#{value}") do
          instance_variable_get("@#{key}_#{value}")
        end
      end
    end

    def initialize(session)
      ATTRIBUTES.each do |hash|
        hash.each do |key, value|
          instance_variable_set("@#{key}_#{value}", session[key][value]) if session[key]
        end
      end
    end

    def fee_paid
      message = I18n.t("fee_paid_#{@fee_paid}", scope: 'summary')
      "#{message}#{payment_date}"
    end

    def payment_date
      ", on #{Date.parse(@fee_date_paid)}" if @fee_date_paid
    end

    def full_name
      [@personal_detail_title,
       @personal_detail_first_name,
       @personal_detail_last_name].join(' ')
    end

    def full_address
      [@applicant_address_address,
       @applicant_address_postcode].join(' ')
    end

  end
end
