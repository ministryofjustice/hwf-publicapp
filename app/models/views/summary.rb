module Views
  class Summary

    ATTRIBUTES = [
      :marital_status_married,
      :savings_and_investment_less_than_limit,
      :benefit_on_benefits,
      :fee_paid,
      :probate_kase,
      :claim_number,
      :form_name_identifier,
      :national_insurance_number,
      :personal_detail_title,
      :personal_detail_first_name,
      :personal_detail_last_name,
      :applicant_address_address,
      :applicant_address_postcode,
      :contact_email
    ].freeze

    ATTRIBUTES.each do |attribute|
      define_method(attribute.to_s) do
        instance_variable_get("@#{attribute}")
      end
    end

    def initialize(session)
      ATTRIBUTES.each do |attribute|
        instance_variable_set("@#{attribute}", session[attribute])
      end
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
