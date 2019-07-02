class AddressPage < BasePage
  set_url '/questions/applicant_address'

  section :content, '#content' do
    element :step_info, '.step-info', text: 'Step 16 of 20'
    element :address_header, 'h1', text: 'What is your address?'
    element :address_label, '.form-label', text: 'Address'
    element :address, '#applicant_address_address'
    element :postcode_label, '.form-label', text: 'Postcode'
    element :postcode, '#applicant_address_postcode'
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
    national_insurance_page.submit_valid_ni
    dob_page.valid_dob
    personal_details_page.submit_full_name
  end

  def address
    address_page.content.address.set('102 Petty France, London')
  end

  def postcode
    address_page.content.postcode.set('SW1H 9AJ')
  end

  def submit_full_address
    address_page.address
    address_page.postcode
    continue
  end
end
