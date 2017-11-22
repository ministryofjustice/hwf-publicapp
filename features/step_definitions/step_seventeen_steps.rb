Given(/^I visit the page for step seventeen$/) do
  step 'I am on the page for step one'
  step 'I submit the form with a valid form number'
  step 'I select no to have you already paid the fee?'
  step 'I click continue'
  step 'I submit the form as single'
  step 'I submit the form with £0 to £2,999 checked'
  step 'I submit the form with no I do not receive one of the benefits listed'
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
  expect(step_seventeen_page.form_group[1].text).to have_content 'Email address'
  expect(step_seventeen_page.hint.text).to eq '(Optional)'
  step_seventeen_page.contact_email.set('test@hmcts.net')
  common_page.continue_button.click
end

When(/^I enter a invalid email address$/) do
  step_seventeen_page.contact_email.set('testhmctsnet')
  common_page.continue_button.click
end

Then(/^I should see share your experience checkbox$/) do
  checkbox_group = step_seventeen_page.form_checkbox
  expect(checkbox_group.contact_feedback_opt_in['type']).to eq 'checkbox'
  expect(checkbox_group.span.text).to have_content 'Check this box if you\'re willing to share your experience'
end

Then(/^I remain on step 17$/) do
  expect(current_path).to eq '/questions/contact'
end

Then(/^I go to step 18 summary$/) do
  expect(current_path).to eq '/summary'
end
