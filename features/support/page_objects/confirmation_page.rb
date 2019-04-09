class ConfirmationPage < BasePage
  set_url '/confirmation/refund'

  element :step_info, '.heading-large', text: 'Step 20 of 20'
  element :confirmation_header, 'h1', text: 'Send your reference number to the court or tribunal dealing with your case'
  section :list, '.list' do
    element :one, 'li', text: 'Deliver your reference number to the court or tribunal dealing with your case (by post or in person)'
    element :two, 'li', text: 'Your application will be assessed by court or tribunal staff'
    element :three, 'li', text: 'You\'ll hear from the court or tribunal if your application is unsuccessful or if they need more information from you'
  end
  element :letter_hint, 'li', text: 'You can use the letter template below:'
  element :letter_template, '.inset'
  element :hwf_reference, 'li', text: 'Reference: HWF-000-000'
  element :warning_notice, '.notice', text: 'Your application for a refund will not proceed until you send your reference number to the court or tribunal'
  element :finish_button, 'input[value="Finish application"]'

  def to_confirmation_page
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
    summary_page.submit_application
  end

  def finish_application
    finish_button.click
  end
end
