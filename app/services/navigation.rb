class Navigation

  STEPS = { marital_status: :savings_and_investment,
            savings_and_investment: :benefit,
            benefit: :dependent,
            dependent: :income,
            income: :fee,
            fee: :probate,
            probate: :claim,
            claim: :form_name,
            form_name: :national_insurance,
            national_insurance: :dob,
            dob: :personal_detail,
            personal_detail: :applicant_address,
            applicant_address: :contact,
            contact: :summary }.freeze

  def steps
    STEPS
  end

end
