class SummaryPage < BasePage
  set_url '/summary'

  section :content, '#content' do
    element :step_info, '.heading-large', text: 'Step 18 of 20'
    element :summary_header, 'h1', text: 'Check details'
    element :check_details_hint, '.text', text: 'Please check your details are correct. If you make changes, you may have to answer new questions and confirm information you’ve already entered.'
    element :probate, '.summary', text: 'Probate case No'
    element :declaration_of_truth, '.text', text: 'Declaration and statement of truth'
    section :summary, 'tbody' do
      sections :question, 'tr' do
        element :page, 'th'
        element :answer, 'td'
        element :change, '.right > a', text: 'Change'
      end
    end
    element :submit_application_button, 'input[value="Submit application and continue"]'
  end

  def to_summary_page_probate_enabled
    form_name_page.load_page
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
    address_page.submit_full_address
    contact_page.valid_email
  end

  def to_summary_page_probate_disabled
    form_name_page.load_page
    form_name_page.submit_valid_form_number
    fee_page.submit_fee_yes
    marital_status_page.submit_married
    savings_investment_page.low_amount_checked
    benefit_page.submit_benefit_yes
    claim_page.submit_claim_no
    national_insurance_page.submit_valid_ni
    dob_page.valid_dob
    personal_details_page.submit_full_name
    address_page.submit_full_address
    contact_page.valid_email
  end

  def submit_application
    content.submit_application_button.click
  end
end
