Given(/^I am on the personal details page with probate enabled$/) do
  probate_enabled
  personal_details_page.to_personal_details_page
  expect(personal_details_page).to be_displayed
  expect(personal_details_page.content).to have_step_info
  expect(personal_details_page.content).to have_header
end

When(/^I enter my title$/) do
  expect(personal_details_page.content).to have_optional_hint
  fill_in 'Title(Optional)', with: 'Ms'
end

When(/^I enter my first name$/) do
  fill_in 'First name', with: 'Sally'
end

When(/^I enter my last name$/) do
  fill_in 'Last name', with: 'Smith'
  continue
end

When(/^I enter my full name$/) do
  personal_details_page.submit_full_name
end

Then(/^I should be taken to personal details page$/) do
  expect(personal_details_page).to be_displayed
end
