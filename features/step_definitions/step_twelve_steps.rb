Given(/^I visit the page for step twelve$/) do
  step 'I am on the page for step one - form name'
  step 'I submit the form with a valid form number'
  step 'I select no to have you already paid the fee?'
  step 'I click continue'
  step 'I submit the form as single'
  step 'I submit the form with £0 to £2,999 checked'
  step 'I submit the form with no I do not receive one of the benefits listed'
  step 'I submit the form with no I do not have any children'
  step 'after selecting working tax credit from income list on step eight'
  step 'I click continue'
  step 'I select between'
  step 'I enter a valid total monthly income'
  step 'I select no to are you paying a fee for a probate case'
end

And(/^I go to step twelve without skipping step eleven$/) do
  step 'I select no to have you already paid the fee?'
  step 'I click continue'
  step 'I submit the form as married'
  step 'I submit the form with £0 to £2,999 checked'
  step 'I submit the form with no I do not receive one of the benefits listed'
  step 'I submit the form with no I do not have any children'
  step 'after selecting wages from income list on step eight'
  step 'I click continue'
  step 'I select between'
  step 'I enter a valid total monthly income'
  step 'I select no to are you paying a fee for a probate case'
end

And(/^I go to step twelve by skipping step eleven$/) do
  step 'I select no to have you already paid the fee?'
  step 'I click continue'
  step 'I submit the form as married'
  step 'I submit the form with £0 to £2,999 checked'
  step 'I submit the form with no I do not receive one of the benefits listed'
  step 'I submit the form with no I do not have any children'
  step 'after selecting wages from income list on step eight'
  step 'I click continue'
  step 'I select between'
  step 'I enter a valid total monthly income'
end

When(/^I select no to do you have a case, claim or notice to pay number$/) do
  expect(step_twelve_page.block_label[0].text).to eq 'No'
  step_twelve_page.number_false.click
  common_page.continue_button.click
end

When(/^I select yes to do you have a case, claim or notice to pay number$/) do
  expect(step_twelve_page.block_label[1].text).to eq 'Yes'
  step_twelve_page.number_true.click
end

When(/^I enter a case, claim or notice to pay number$/) do
  expect(step_twelve_page.form_label.text).to eq 'The case, claim or ‘notice to pay’ number is'
  step_twelve_page.claim_default_identifier.set('012345678')
  common_page.continue_button.click
end

Then(/^I should see help with case number copy$/) do
  expect(step_twelve_page).to have_creates_reference_number_copy
  expect(step_twelve_page).to have_ongoing_case_copy
  expect(step_twelve_page).to have_dont_have_reference_number_copy
end
