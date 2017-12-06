def group_three(index)
  step_three_page.content.form_group[index]
end

Given(/^I visit the page for step three$/) do
  step 'I am on the page for step one'
  step 'I submit the form with a valid form number'
  step 'I select no to have you already paid the fee?'
  step 'I click continue'
end

When(/^I submit the form as single$/) do
  expect(group_three(0)).to have_single
  group_three(0).marital_status_married_false.click
  common_page.continue_button.click
end

When(/^I submit the form as married$/) do
  expect(group_three(0)).to have_married
  group_three(0).marital_status_married_true.click
  common_page.continue_button.click
end

Then(/^I should see help with status copy$/) do
  expect(group_three(1)).to have_help_choose_married
  expect(group_three(1)).to have_help_married
  expect(group_three(1)).to have_help_civil_partners
  expect(group_three(1)).to have_help_living_together
  expect(group_three(1)).to have_help_same_address
  expect(group_three(1)).to have_help_live_apart
  expect(group_three(1)).to have_help_choose_single
  expect(group_three(1)).to have_help_divorce
  expect(group_three(1)).to have_help_gender
  expect(group_three(1)).to have_help_domestic_violence
  expect(group_three(1)).to have_help_forced_marriage
  expect(group_three(1)).to have_help_multiple_fee
end
