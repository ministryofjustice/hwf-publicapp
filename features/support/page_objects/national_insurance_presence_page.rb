class NationalInsurancePresencePage < BasePage
  set_url '/questions/national_insurance_presence'

  section :content, '#content' do
    element :step_info, '.govuk-caption-l', text: 'Step 13 of 20'
    element :header, 'h1', text: 'Do you have a National Insurance number?'
    element :hint, 'p', text: 'Select one'
    element :yes, 'label', text: 'Yes'
    element :no, 'label', text: 'No'
    element :where_to_find, 'summary', text: 'Where to find my National Insurance number?'
    element :look_for_ni_text, 'li', text: 'look for your National Insurance number on payslips or official letters about tax, pensions or benefits'
    element :ask_for_reminder_link, 'a', text: 'ask for a reminder through the post'
    element :blank_error_link, '#error-summary-title', text: 'There is a problem'
    element :invalid_error_link, 'a', text: 'is not included in the list'
  end

  def to_national_insurance_presence_page
    form_name_page.to_form_name
    form_name_page.submit_valid_form_number
    fee_page.submit_fee_yes
    marital_status_page.submit_married
    savings_investment_page.low_amount_checked
    benefit_page.submit_benefit_yes
    probate_page.submit_probate_no
    claim_page.submit_claim_no
  end

  def submit_yes
    national_insurance_presence_page.content.yes.click
    continue
  end

  def submit_no
    national_insurance_presence_page.content.no.click
    continue
  end
end
