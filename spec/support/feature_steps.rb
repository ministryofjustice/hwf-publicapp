# rubocop:disable ModuleLength
module FeatureSteps
  def given_user_provides_all_data
    visit '/'
    click_link_or_button 'Apply now'
    fill_marital_status
    fill_savings_and_investment
    fill_benefit
    fill_dependent
    fill_income
    fill_fee
    fill_probate
    fill_claim
    fill_form_name
    fill_national_insurance
    fill_dob
    fill_personal_detail
    fill_applicant_address
    fill_contact
  end

  def given_user_provides_all_data_for_refund
    visit '/'
    click_link_or_button 'Apply now'
    fill_marital_status
    fill_savings_and_investment
    fill_benefit
    fill_dependent
    fill_income
    fill_fee(true)
    fill_probate
    fill_claim
    fill_form_name
    fill_national_insurance
    fill_dob
    fill_personal_detail
    fill_applicant_address
    fill_contact
  end

  def given_user_starts_an_application
    visit '/'
    click_link_or_button 'Apply now'
    fill_marital_status
  end

  def when_they_submit_the_application
    click_link_or_button 'Complete application'
  end

  def when_they_go_back_to_homepage_and_start_again
    visit '/'
    click_link_or_button 'Apply now'
  end

  def then_their_data_is_not_persisted
    visit question_path(:marital_status)
    expect(page).to have_unchecked_field('marital_status_married_false')
    expect(page).to have_unchecked_field('marital_status_married_true')
  end

  def fill_contact
    fill_in 'contact_email', with: 'foo@bar.com'
    click_button 'Continue'
  end

  def fill_applicant_address
    fill_in 'applicant_address_address', with: 'Foo Street'
    fill_in 'applicant_address_postcode', with: 'Bar'
    click_button 'Continue'
  end

  def fill_personal_detail
    fill_in 'personal_detail_title', with: 'Sir'
    fill_in 'personal_detail_first_name', with: 'Bob'
    fill_in 'personal_detail_last_name', with: 'Oliver'
    click_button 'Continue'
  end

  def fill_dob
    fill_in 'dob_date_of_birth', with: '01/01/1980'
    click_button 'Continue'
  end

  def fill_national_insurance
    fill_in 'national_insurance_number', with: 'AB123456A'
    click_button 'Continue'
  end

  def fill_form_name
    fill_in 'form_name_identifier', with: 'N1'
    click_button 'Continue'
  end

  def fill_claim
    choose 'claim_number_false'
    click_button 'Continue'
  end

  def fill_probate
    choose 'probate_kase_false'
    click_button 'Continue'
  end

  def fill_fee(refund = false)
    if refund
      choose 'fee_paid_true'
      fill_in :fee_date_paid, with: 3.weeks.ago
    else
      choose 'fee_paid_false'
    end

    click_button 'Continue'
  end

  def fill_income
    fill_in :income_wages, with: 100.0
    click_button 'Continue'
  end

  def fill_dependent
    choose 'dependent_children_false'
    click_button 'Continue'
  end

  def fill_benefit
    choose 'benefit_on_benefits_false'
    click_button 'Continue'
  end

  def fill_savings_and_investment
    choose 'savings_and_investment_less_than_limit_false'
    click_button 'Continue'
  end

  def fill_marital_status
    choose 'marital_status_married_false'
    click_button 'Continue'
  end
end

RSpec.configure do |config|
  config.include FeatureSteps, type: :feature
end
