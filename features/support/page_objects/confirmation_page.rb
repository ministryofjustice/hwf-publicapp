class ConfirmationPage < BasePage
  set_url '/confirmation'

  section :content, '#content' do
    element :step_info, '.govuk-caption-l', text: 'Step 19 of 20'
    element :header, 'h1', text: 'Reference number to add to your claim form'
    element :confirmation_header, 'h2', text: 'Your application for help with fees is not finished yet'
    section :list, '.list' do
      element :one, 'li', text: 'You must write this reference number HWF-000-000 on your C100 form.'
      element :two, 'li', text: 'Write the reference number in the ‘HWF reference’ field if there is one. If not, you should write it wherever there is space on your C100 form.'
      element :three, 'li', text: 'You can also save or print this page and attach it to your C100 form.'
      element :four, 'li', text: 'If you provided your email address, you\'ll get your application reference number by email.'
    end
  end

  def to_confirmation_page
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
    national_insurance_page.submit_valid_ni
    dob_page.valid_dob
    personal_details_page.submit_full_name
    address_page.submit_full_address
    contact_page.valid_email
    summary_page.submit_application
  end
end
