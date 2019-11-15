class PersonalDetailsPage < BasePage
  set_url '/questions/personal_detail'

  section :content, '#content' do
    element :step_info, '.govuk-caption-l', text: 'Step 15 of 20'
    element :personal_details_header, 'h1', text: 'What is your full name?'
    element :optional_hint, '.optional', text: 'Optional'
  end

  def to_personal_details_page
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
  end

  def submit_full_name
    # fill_in 'Title', with: 'Ms'
    fill_in 'First name', with: 'Sally'
    fill_in 'Last name', with: 'Smith'
    continue
  end
end
