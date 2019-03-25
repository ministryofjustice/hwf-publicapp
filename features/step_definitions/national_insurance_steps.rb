Given(/^I am on the national insurance page$/) do
  answer_up_to_national_insurance_page
  expect(national_insurance_page.content).to have_step_info
  expect(national_insurance_page.content).to have_national_insurance_header
  expect(national_insurance_page.content).to have_national_insurance_text
end

When(/^I enter a valid national insurance number$/) do
  national_insurance_page.submit_valid_ni
end

When(/^I click on if you don't know your national insurance number$/) do
  national_insurance_page.content.help_with_ni_dropdown.click
end

And(/^I enter a invalid national insurance number$/) do
  national_insurance_page.submit_invalid_ni
end

Then(/^I should see if you don't know your national insurance number copy$/) do
  expect(national_insurance_page.content).to have_look_for_ni_text
  expect(national_insurance_page.content.ask_for_reminder_link['href']).to eq 'https://www.gov.uk/lost-national-insurance-number'
  expect(national_insurance_page.content).to have_no_ni_number_text
end

Then(/^I should see enter a valid National Insurance number error message$/) do
  expect(national_insurance_page.content).to have_invalid_error_message
  expect(national_insurance_page.content).to have_invalid_error_link
end

Then(/^I should see enter your National Insurance number error message$/) do
  expect(national_insurance_page.content).to have_blank_error_message
  expect(national_insurance_page.content).to have_blank_error_link
end

Then(/^I should be taken to national insurance page$/) do
  expect(national_insurance_page).to be_displayed
end
