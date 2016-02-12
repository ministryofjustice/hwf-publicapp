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
      :national_insurance_number
    ]

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
  end
end
