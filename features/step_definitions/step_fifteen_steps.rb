Given(/^I visit the page for step fifteen$/) do
  answer_up_to_income_amount_married
  income_amount_page.submit_income_amount
  probate_page.submit_no
  claim_page.submit_no
  national_insurance_page.submit_valid_ni
  step 'I enter a valid date of birth'
end

When(/^I enter my title$/) do
  expect(step_fifteen_page.form_group[0].text).to have_content 'Title'
  expect(step_fifteen_page.hint.text).to eq '(Optional)'
  step_fifteen_page.title.set('Ms')
end

When(/^I enter my first name$/) do
  expect(step_fifteen_page.form_group[1].text).to eq 'First name'
  step_fifteen_page.first_name.set('Sally')
end

When(/^I enter my last name$/) do
  expect(step_fifteen_page.form_group[2].text).to eq 'Last name'
  step_fifteen_page.last_name.set('Smith')
  common_page.continue_button.click
end

When(/^I enter my full name$/) do
  expect(step_fifteen_page.form_group[1].text).to eq 'First name'
  step_fifteen_page.first_name.set('Sally')
  expect(step_fifteen_page.form_group[2].text).to eq 'Last name'
  step_fifteen_page.last_name.set('Smith')
  common_page.continue_button.click
end
