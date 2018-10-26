Given(/^I visit the page for step fourteen - What is your date of birth\?$/) do
  answer_up_to_dob
  expect(dob_page.content).to have_step_info
  expect(dob_page.content).to have_dob_header
  expect(dob_page.content).to have_dob_hint
end

When(/^I enter a valid date of birth$/) do
  valid_dob
end

When(/^I enter a date of less than fifteen years$/) do
  under_age_dob
end

And(/^I enter a invalid date of birth$/) do
  over_age_dob
end

Then(/^I should see this format hint$/) do
  expect(dob_page.hint.text).to eq 'Use this format D D / M M / Y Y Y Y'
end

Then(/^I should see you must be over 15 to use this service error message$/) do
  expect(dob_page.content).to have_under_age_error_link
  expect(dob_page.content).to have_under_age_error_message
end

Then(/^I should see check this date of birth is correct error message$/) do
  expect(dob_page.content).to have_over_age_error_link
  expect(dob_page.content).to have_over_age_error_message
end

Then(/^I should see enter the date of birth in this format error message$/) do
  expect(dob_page.content).to have_blank_error_link
  expect(dob_page.content).to have_blank_error_message
end
