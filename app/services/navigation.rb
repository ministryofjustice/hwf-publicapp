class Navigation

  def steps
    { marital_status: :savings_and_investment,
      savings_and_investment: :benefit,
      benefit: :fee,
      fee: :probate,
      probate: :claim,
      claim: :form_name,
      form_name: :national_insurance,
      national_insurance: :personal_detail,
      personal_detail: :applicant_address,
      applicant_address: :contact,
      contact: :summary }
  end

end
