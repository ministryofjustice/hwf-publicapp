Given(/^I am on the form number page$/) do
  form_name_page.load_page
  expect(form_name_page.content).to have_step_info
  expect(form_name_page.content).to have_form_name_header
  expect(form_name_page.content).to have_enter_court_hint
  expect(form_name_page.content).to have_form_label
end

Then(/^I should see the please note timeout$/) do
  expect(form_name_page.content).to have_please_note
  expect(form_name_page.content).to have_timeout
end

When(/^I submit the form with a valid form number$/) do
  submit_valid_form_number
end

When(/^I submit the form with a valid form name$/) do
  submit_valid_form_name
end

When(/^I submit the form with I don’t know the form name or number checked$/) do
  expect(form_name_page.content).to have_form_name_unknown_label
  form_name_page.content.form_name_unknown.click
  continue
end

When(/^I submit the form without a form name or number$/) do
  continue
end

Then(/^I see more information about the form name or number$/) do
  expect(form_name_page.content).to have_find_form_name
  expect(form_name_page.content).to have_no_form_name
end

Then(/^I should be taken to fee page$/) do
  expect(fee_page).to be_displayed
end

Then(/^I should see enter the form name or number error message$/) do
  expect(form_name_page.content).to have_error_link
  expect(form_name_page.content).to have_error_message
end
