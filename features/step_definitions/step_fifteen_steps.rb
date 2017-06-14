Given(/^I visit the page for step fifteen$/) do
  step 'I visit the page for step one'
  step 'I enter a valid form number'
  step 'I select no to have you already paid the fee?'
  step 'I select single'
  step 'I select £0 to £2,999'
  step 'I select no to do you receive any of the following benefits?'
  step 'I select no to do you have any children'
  step 'after selecting working tax credit from income list on step eight'
  step 'I click continue'
  step 'I select between'
  step 'I enter a valid total monthly income'
  step 'I select no to are you paying a fee for a probate case'
  step 'I select no to do you have a case, claim or notice to pay number'
  step 'I enter a valid national insurance number'
  step 'I enter a valid date of birth'
end

When(/^I enter my title$/) do
  expect(step_fifteen_page.form_group[0].text).to eq 'Title(Optional)'
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
