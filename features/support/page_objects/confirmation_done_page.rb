class ConfirmationDonePage < BasePage
  set_url '/confirmation/done'

  section :content, '#content' do
    element :step_info, '.step-info', text: 'Step 20 of 20'
    element :header, 'h1', text: 'Send your claim form'
    element :send_your_form, 'h2', text: 'Send your C100 form with your HWF-000-000 reference on it to complete the process'
    element :post, '.post', text: 'Deliver your paperwork to the court or tribunal dealing with your case. You can do this by post or in person.'
    section :what_happens_next, '.steps-panel' do
      element :one, 'li', text: 'Your application will be assessed by court or tribunal staff. This usually takes no longer than 21 days.'
      element :two, 'li', text: 'You\'ll hear from the court or tribunal if your application is unsuccessful or if they need more information from you.'
      element :three, 'li', text: 'If your application is successful you\'ll hear directly from the court or tribunal dealing with your case.'
    end
    element :finish_application_button, 'input[value="Finish application"]'
  end

  def to_confirmation_done_page
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
    continue
  end
end
