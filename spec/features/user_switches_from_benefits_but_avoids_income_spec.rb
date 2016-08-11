require 'rails_helper'

RSpec.feature 'User completes their application' do
  scenario 'up to the summary page' do
    given_user_provides_all_data_for_benefit
    find(:xpath, "//a[@href='#{question_path(:benefit)}']").click
    choose :benefit_on_benefits_false
    click_button 'Continue'
    # simulate user returning to summary via the back button (twice)
    visit summary_path
    expect(page).to have_content 'Check details'
    expect(page).to have_content 'Not receiving eligible benefits'
    expect(page).to have_content 'IncomePlease answer questions about your income'
    expect(page).to have_content 'You’ve made changes. Please answer the highlighted questions to complete your application.'
  end
end
