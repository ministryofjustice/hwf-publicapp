class ContactPage < BasePage
  set_url '/questions/contact'

  section :content, '#content' do
    element :step_info, '.govuk-caption-l', text: 'Step 19 of 22'
    element :header, 'h1', text: 'What\'s your email address?'
    element :email_label, '.govuk-label', text: 'Email address'
    element :optional_hint, '.optional', text: '(Optional)'
    element :contact_email, '#contact_email'
    element :confirmation_email, 'p', text: 'We will email you to confirm your application has been received.'
    element :share_experience, '.govuk-checkboxes', text: 'Check this box if you\'re willing to share your experience of this service.'
  end

  def to_contact_page
    form_name_page.to_form_name
    form_name_page.submit_valid_form_number
    fee_page.submit_fee_yes
    national_insurance_presence_page.submit_yes
    national_insurance_page.submit_valid_ni
    marital_status_page.submit_married
    savings_investment_page.low_amount_checked
    benefit_page.submit_benefit_yes
    probate_page.submit_probate_no
    claim_page.submit_claim_no
    dob_page.valid_dob
    personal_details_page.submit_full_name
    address_page.submit_full_address
  end

  def valid_email
    content.contact_email.set 'test@hmcts.net'
    continue
  end

  def invalid_email
    content.contact_email.set 'testhmctsnet'
    continue
  end
end
