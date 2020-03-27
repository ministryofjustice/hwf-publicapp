class SummaryPage < BasePage
  set_url '/summary'

  section :content, '#content' do
    element :step_info, '.govuk-caption-l', text: 'Step 18 of 20'
    element :summary_header, 'h1', text: 'Check details'
    element :check_details_hint, 'p', text: 'Please check your details are correct. If you make changes, you may have to answer new questions and confirm information you’ve already entered.'
    element :probate, '.govuk-summary-list__row', text: 'Probate case No'
    element :declaration_of_truth, 'h2', text: 'Declaration and statement of truth'
    sections :summary_row, '.govuk-summary-list__row' do
      element :action, 'a', text: 'Change'
    end
    element :submit_application_button, 'input[value="Submit application and continue"]'
  end

  def to_summary_page_probate_enabled
    form_name_page.to_form_name
    form_name_page.submit_valid_form_number
    fee_page.submit_fee_no
    marital_status_page.submit_married
    savings_investment_page.medium_amount_checked
    savings_investment_extra_page.submit_yes
    benefit_page.submit_benefit_no
    dependent_page.submit_dependent_no
    income_kind_page.submit_no_income
    probate_page.submit_probate_no
    claim_page.submit_claim_no
    national_insurance_presence_page.submit_yes
    national_insurance_page.submit_valid_ni
    dob_page.static_dob
    personal_details_page.submit_full_name
    address_page.submit_full_address
    contact_page.valid_email
  end

  def to_summary_page_probate_disabled
    form_name_page.to_form_name
    form_name_page.submit_valid_form_number
    fee_page.submit_fee_no
    marital_status_page.submit_married
    savings_investment_page.low_amount_checked
    benefit_page.submit_benefit_yes
    claim_page.submit_claim_no
    national_insurance_presence_page.submit_yes
    national_insurance_page.submit_valid_ni
    dob_page.static_dob
    personal_details_page.submit_full_name
    address_page.submit_full_address
    contact_page.valid_email
  end

  def home_office_number
    form_name_page.to_form_name
    form_name_page.submit_valid_form_number
    fee_page.submit_fee_no
    marital_status_page.submit_married
    savings_investment_page.low_amount_checked
    benefit_page.submit_benefit_yes
    claim_page.submit_claim_no
    national_insurance_presence_page.submit_no
  end

  def to_summary_page_with_ho_number
    home_office_page.submit_valid_home_office_number
    dob_page.static_dob
    personal_details_page.submit_full_name
    address_page.submit_full_address
    contact_page.valid_email
  end

  def submit_application
    content.submit_application_button.click
  end
end
