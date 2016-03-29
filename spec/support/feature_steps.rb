module FeatureSteps
  def given_user_provides_all_data
    visit '/'
    click_link_or_button 'Apply now'
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
    fill_in 'contact_email', with: 'foo@bar.com'
    click_button 'Continue'
  end

  def given_user_provides_all_data_for_refund
    visit '/'
    click_link_or_button 'Apply now'
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
    choose 'fee_paid_true'
    fill_in :fee_date_paid, with: 3.weeks.ago
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
    fill_in 'contact_email', with: 'foo@bar.com'
    click_button 'Continue'
  end

  def given_user_starts_an_application
    visit '/'
    click_link_or_button 'Apply now'
    choose 'marital_status_married_false'
    click_button 'Continue'
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
end

RSpec.configure do |config|
  config.include FeatureSteps, type: :feature
end
