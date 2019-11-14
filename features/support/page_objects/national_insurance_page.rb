class NationalInsurancePage < BasePage
  set_url '/questions/national_insurance'

  section :content, '#content' do
    element :step_info, '.govuk-caption-l', text: 'Step 13 of 20'
    element :national_insurance_header, 'h1', text: 'What is your National Insurance number?'
    element :national_insurance_text, 'p', text: 'For example, QQ123456C'
    element :national_insurance_number, '#national_insurance_number'
    element :help_with_ni_dropdown, 'summary', text: 'If you don’t know your National Insurance number'
    element :look_for_ni_text, 'li', text: 'look for your National Insurance number on payslips or official letters about tax, pensions or benefits'
    element :ask_for_reminder_link, 'a', text: 'ask for a reminder through the post'
    element :no_ni_number_text, 'p', text: "If you don't have a National Insurance number, you need to"
    element :no_ni_number_link, 'a', text: "use the paper form"
    element :blank_error_link, 'a', text: 'Enter your National Insurance number'
    element :blank_error_message, '.error-message', text: 'Enter your National Insurance number'
    element :invalid_error_link, 'a', text: 'Enter a valid National Insurance number'
  end

  def to_national_insurance_page
    form_name_page.to_form_name
    form_name_page.submit_valid_form_number
    fee_page.submit_fee_yes
    marital_status_page.submit_married
    savings_investment_page.low_amount_checked
    benefit_page.submit_benefit_yes
    probate_page.submit_probate_no
    claim_page.submit_claim_no
  end

  def submit_valid_ni
    national_insurance_page.content.national_insurance_number.set('JL806367D')
    continue
  end

  def submit_invalid_ni
    national_insurance_page.content.national_insurance_number.set('012345678')
    continue
  end
end
