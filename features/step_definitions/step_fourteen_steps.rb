Given(/^I visit the page for step fourteen$/) do
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
end

When(/^I enter a valid date of birth$/) do
  step_fourteen_page.dob_date_of_birth.set(Time.zone.today - 34.years)
  common_page.continue_button.click
end

When(/^I enter a date of less than fifteen years$/) do
  step_fourteen_page.dob_date_of_birth.set(Time.zone.today - 14.years)
  common_page.continue_button.click
end

And(/^I enter a invalid date of birth$/) do
  step_fourteen_page.dob_date_of_birth.set(Time.zone.today - 150.years)
  common_page.continue_button.click
end

Then(/^I should see this format hint$/) do
  expect(step_fourteen_page.hint.text).to eq 'Use this format D D / M M / Y Y Y Y'
end
