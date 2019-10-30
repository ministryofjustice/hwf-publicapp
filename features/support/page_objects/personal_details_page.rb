class PersonalDetailsPage < BasePage
  set_url '/questions/personal_detail'

  section :content, '#content' do
    element :step_info, '.step-info', text: 'Step 15 of 20'
    element :personal_details_header, 'h1', text: 'What is your full name?'
    element :title_label, '.govuk-label', text: 'Title'
    element :optional_hint, '.hint', text: 'Optional'
    element :title, '#personal_detail_title'
    element :first_name_label, '.govuk-label', text: 'First name'
    element :first_name, '#personal_detail_first_name'
    element :last_name_label, '.govuk-label', text: 'Last name'
    element :last_name, '#personal_detail_last_name'
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

  def title
    personal_details_page.content.title.set 'Ms'
  end

  def first_name
    personal_details_page.content.first_name.set 'Sally'
  end

  def last_name
    personal_details_page.content.last_name.set 'Smith'
  end

  def submit_full_name
    personal_details_page.content.title.set 'Ms'
    personal_details_page.content.first_name.set 'Sally'
    personal_details_page.content.last_name.set 'Smith'
    continue
  end
end
