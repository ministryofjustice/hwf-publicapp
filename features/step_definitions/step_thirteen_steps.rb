Given(/^I visit the page for step thirteen$/) do
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
end

When(/^I enter a valid national insurance number$/) do
  step_thirteen_page.national_insurance_number.set('JL806367D')
  common_page.continue_button.click
end

When(/^I click on if you don't know your national insurance number$/) do
  expect(group_common(1).help_with.text).to eq 'If you don’t know your National Insurance number'
  group_common(1).help_with.click
end

And(/^I enter a invalid national insurance number$/) do
  step_thirteen_page.national_insurance_number.set('012345678')
  common_page.continue_button.click
end

Then(/^I should see if you don't know your national insurance number copy$/) do
  case_number_copy = step_thirteen_page.form_group[1].details_content
  expect(case_number_copy.li.count).to eq 2
  expect(case_number_copy.li[1].a['href']).to eq 'https://www.gov.uk/lost-national-insurance-number'
  expect(case_number_copy.p.count).to eq 1
end
