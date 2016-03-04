require 'rails_helper'

RSpec.feature 'User details are not persisted' do
  include_context 'shared encryption setup'
  before { staff_app_response }

  scenario 'User completes the application and their data is cleared out of the session' do
    given_user_provides_all_data
    when_they_submit_the_application
    then_their_data_is_not_persisted
  end

  scenario 'User starts the application again and all the previous data is cleared out of the session' do
    given_user_starts_an_application
    when_they_go_back_to_homepage_and_start_again
    then_their_data_is_not_persisted
  end

  def given_user_provides_all_data
    visit '/'
    click_button 'Apply now'
    choose 'marital_status_married_false'
    click_button 'Continue'
    choose 'savings_and_investment_less_than_limit_false'
    click_button 'Continue'
    choose 'benefit_on_benefits_false'
    click_button 'Continue'
    choose 'dependent_children_false'
    click_button 'Continue'
    fill_in :income_wages, with: 100.0
    click_button 'Continue'
    choose 'fee_paid_false'
    click_button 'Continue'
    choose 'probate_kase_false'
    click_button 'Continue'
    choose 'claim_number_false'
    click_button 'Continue'
    fill_in 'form_name_identifier', with: 'N1'
    click_button 'Continue'
    fill_in 'national_insurance_number', with: 'AB123456A'
    click_button 'Continue'
    fill_in 'dob_date_of_birth', with: '01/01/1980'
    click_button 'Continue'
    fill_in 'personal_detail_title', with: 'Sir'
    fill_in 'personal_detail_first_name', with: 'Bob'
    fill_in 'personal_detail_last_name', with: 'Oliver'
    click_button 'Continue'
    fill_in 'applicant_address_address', with: 'Foo Street'
    fill_in 'applicant_address_postcode', with: 'Bar'
    click_button 'Continue'
    check 'contact_email_option'
    fill_in 'contact_email', with: 'foo@bar.com'
    click_button 'Continue'
  end

  def given_user_starts_an_application
    visit '/'
    click_button 'Apply now'
    choose 'marital_status_married_false'
    click_button 'Continue'
  end

  def when_they_submit_the_application
    click_button 'Complete and send application'
  end

  def when_they_go_back_to_homepage_and_start_again
    visit '/'
    click_button 'Apply now'
  end

  def then_their_data_is_not_persisted
    visit '/marital-status'
    expect(page).to have_unchecked_field('marital_status_married_false')
    expect(page).to have_unchecked_field('marital_status_married_true')
  end
end
