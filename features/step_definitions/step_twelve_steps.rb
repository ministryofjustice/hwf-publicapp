And(/^I am on step step twelve$/) do
  step 'I select no to have you already paid the fee?'
  step 'I select married'
  step 'I select £0 to £2,999'
  step 'I select no to do you receive any of the following benefits?'
  step 'I select no to do you have any children'
  step 'after selecting wages from income list on step eight'
  step 'I click the continue button'
  step 'I select between'
  step 'I enter a valid total monthly income'
end

Given(/^I visit the page for step twelve$/) do
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
end

When(/^I select no to do you have a case, claim or notice to pay number$/) do
  expect(step_twelve_page.block_label[0].text).to eq 'No'
  step_twelve_page.number_false.click
  common_page.continue_button.click
end

When(/^I select yes to do you have a case, claim or notice to pay number$/) do
  expect(step_twelve_page.block_label[1].text).to eq 'Yes'
  common_page.continue_button.click
end

When(/^I enter a case, claim or notice to pay number$/) do
  expect(step_twelve_page.form_label.text).to eq 'The case, claim or ‘notice to pay’ number is'
  step_twelve_page.claim_default_identifier.set('012345678')
  common_page.continue_button.click
end

And(/^I enter a employment tribunal number$/) do
  expect(step_twelve_page.form_label.text).to eq 'Employment tribunal claim number'
  step_twelve_page.claim_et_identifier.set('012345678')
  common_page.continue_button.click
end

Then(/^I should see help with employment tribunal number copy$/) do
  case_number_copy = step_twelve_page.form_group[2].details_content
  expect(case_number_copy.p.count).to eq 3
end

Then(/^I should see help with case number copy$/) do
  case_number_copy = step_twelve_page.form_group[2].details_content
  expect(case_number_copy.p.count).to eq 3
end
