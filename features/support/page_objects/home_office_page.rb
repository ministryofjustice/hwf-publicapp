class HomeOfficePage < BasePage
  set_url '/questions/home_office?locale=en'

  section :content, '#content' do
    element :header, 'h1', text: 'What is your Home Office reference number?'
    element :step_info, '.govuk-caption-l', text: 'Step 14 of 20'
    element :hint, 'p', text: 'For example, L123456 or L123456/1 (for family members)'
    element :home_offce_number, '#home_office_ho_number'
    element :user_paper_form, 'p', text: "If you don't have either National Insurance number, or a Home Office reference number, you'll need to fill in the paper application form."
    element :paper_form_link, 'a', text: 'paper application form'
    element :help_text, 'li', text: 'Your Home Office reference number can be found on any correspondence you have received from the Home Office'
    element :error_link, '.error-link', text: 'Enter a valid Home Office reference number'
    element :error_message, '.govuk-error-message', text: 'Enter a valid Home Office reference number'
    element :blank_error_link, '.error-link', text: 'Enter your Home Office reference number'
    element :blank_error_message, '.govuk-error-message', text: 'Enter your Home Office reference number'
  end

  def to_home_office_page
    form_name_page.to_form_name
    form_name_page.submit_valid_form_number
    fee_page.submit_fee_yes
    marital_status_page.submit_married
    savings_investment_page.low_amount_checked
    benefit_page.submit_benefit_yes
    probate_page.submit_probate_no
    claim_page.submit_claim_no
    national_insurance_presence_page.submit_no
  end

  def submit_valid_home_office_number
    home_office_page.content.home_offce_number.set '1212-0001-0240-0490/01'
    continue
  end
end
