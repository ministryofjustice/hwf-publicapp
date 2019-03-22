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

When(/^I submit the form with I don’t have a form checked$/) do
  form_name_page.content.no_form.click
  continue
end

When(/^I submit the form without a number$/) do
  continue
end

Then(/^I should see more information about what to put in the form number field$/) do
  expect(form_name_page.content).to have_help_hearing_fees
end

Then(/^I should be taken to fee page$/) do
  expect(fee_page).to be_displayed
end

Then(/^I should see enter a number error message$/) do
  expect(form_name_page.content).to have_error_link
  expect(form_name_page.content).to have_error_message
end

When(/^I submit the form with a help with fees form number '(.+?)'$/) do |num|
  form_name_page.content.form_name.set num
  continue
end

Then(/^I should see you entered the help with fees form number error message$/) do
  expect(form_name_page.content).to have_invalid_link
  expect(form_name_page.content).to have_invalid_message
end
