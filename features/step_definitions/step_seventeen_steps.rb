Given(/^I visit the page for step seventeen$/) do
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
  step 'I enter my full name'
  step 'I enter my address with postcode'
end

Then(/^I should see confirmation copy$/) do
  expect(step_seventeen_page.form_group[0].text).to have_content 'confirm your application has been received'
end

When(/^I enter a valid email address$/) do
  expect(step_seventeen_page.form_group[1].text).to have_content 'Email address (Optional)'
  step_seventeen_page.contact_email.set('test@hmcts.net')
  common_page.continue_button.click
end

Then(/^I should see share your experience checkbox$/) do
  binding.pry
end