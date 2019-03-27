Given(/^I visit the contact page with probate enabled$/) do
  travel_to a_day_before_disable_probate_fees
  puts 'probate is disabled: ' + ProbateFeesSwitch.disable_probate_fees?.to_s
  answer_up_to_income_amount_married
  step 'I submit the form with my monthly income'
  probate_page.submit_no
  claim_page.submit_no
  national_insurance_page.submit_valid_ni
  dob_page.valid_dob
  step 'I enter my full name'
  step 'I enter my address with postcode'
end

Then(/^I should see confirmation copy$/) do
  expect(contact_page.form_group[0].text).to have_content 'confirm your application has been received'
end

When(/^I enter a valid email address$/) do
  expect(contact_page.form_group[1].text).to have_content 'Email address'
  expect(contact_page.hint.text).to eq '(Optional)'
  contact_page.contact_email.set('test@hmcts.net')
  common_page.continue_button.click
end

When(/^I enter a invalid email address$/) do
  contact_page.contact_email.set('testhmctsnet')
  common_page.continue_button.click
end

Then(/^I should see share your experience checkbox$/) do
  checkbox_group = contact_page.form_checkbox
  expect(checkbox_group.contact_feedback_opt_in['type']).to eq 'checkbox'
  expect(checkbox_group.span.text).to have_content 'Check this box if you\'re willing to share your experience'
end

Then(/^I remain on this page$/) do
  expect(contact_page).to be_displayed
end

Then(/^I should be taken to contact page$/) do
  expect(contact_page).to be_displayed
end
