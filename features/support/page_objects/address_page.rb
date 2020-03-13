class AddressPage < BasePage
  set_url '/questions/applicant_address'

  section :content, '#content' do
    element :step_info, '.govuk-caption-l', text: 'Step 16 of 20'
    element :address_header, 'h1', text: 'What is your address?'
  end

  def to_address_page
    form_name_page.to_form_name
    form_name_page.submit_valid_form_number
    fee_page.submit_fee_yes
    marital_status_page.submit_married
    savings_investment_page.low_amount_checked
    benefit_page.submit_benefit_yes
    probate_page.submit_probate_no
    claim_page.submit_claim_no
    national_insurance_presence_page.submit_yes
    national_insurance_page.submit_valid_ni
    dob_page.valid_dob
    personal_details_page.submit_full_name
  end

  def submit_full_address
    fill_in 'Address', with: '102 Petty France, London'
    fill_in 'Postcode', with: 'SW1H 9AJ'
    continue
  end
end
