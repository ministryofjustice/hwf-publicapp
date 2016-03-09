module Views
  class Summary

    attr_reader :income_total

    ATTRIBUTES = [
      { marital_status: 'married' },
      { savings_and_investment: 'less_than_limit' },
      { benefit: 'on_benefits' },
      { dependent: 'children' },
      { dependent: 'children_number' },
      { fee: 'paid' },
      { fee: 'date_paid' },
      { probate: 'kase' },
      { probate: 'deceased_name' },
      { probate: 'date_of_death' },
      { claim: 'number' },
      { form_name: 'identifier' },
      { national_insurance: 'number' },
      { dob: 'date_of_birth' },
      { personal_detail: 'title' },
      { personal_detail: 'first_name' },
      { personal_detail: 'last_name' },
      { applicant_address: 'address' },
      { applicant_address: 'postcode' },
      { contact: 'email_option' },
      { contact: 'email' },
      { contact: 'phone_option' },
      { contact: 'phone' },
      { contact: 'post_option' }
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
      @income_total = build_total(session)
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

    def any_contact
      @contact_email_option || @contact_phone_option || @contact_post_option
    end

    def probate_date_of_death
      Date.parse(@probate_date_of_death) unless @probate_date_of_death.nil?
    end

    def dob_date_of_birth
      Date.parse(@dob_date_of_birth) unless @dob_date_of_birth.nil?
    end

    def children
      @dependent_children ? @dependent_children_number : I18n.t('summary.children_false')
    end

    private

    def build_total(session)
      total = 0
      session[:income].try(:each) do |_k, v|
        total += v if v.present? && v.is_a?(Float)
      end
      total
    end
  end
end
