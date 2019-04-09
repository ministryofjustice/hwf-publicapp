Given(/^I am on the personal details page with probate enabled$/) do
  probate_enabled
  personal_details_page.to_personal_details_page
  expect(personal_details_page).to be_displayed
  expect(personal_details_page.content).to have_step_info
  expect(personal_details_page.content).to have_personal_details_header
end

When(/^I enter my title$/) do
  expect(personal_details_page.content).to have_title_label
  expect(personal_details_page.content).to have_optional_hint
  personal_details_page.title
end

When(/^I enter my first name$/) do
  expect(personal_details_page.content).to have_first_name_label
  personal_details_page.first_name
end

When(/^I enter my last name$/) do
  expect(personal_details_page.content).to have_last_name_label
  personal_details_page.last_name
  common_page.continue_button.click
end

When(/^I enter my full name$/) do
  personal_details_page.submit_full_name
  common_page.continue_button.click
end

Then(/^I should be taken to personal details page$/) do
  expect(personal_details_page).to be_displayed
end
