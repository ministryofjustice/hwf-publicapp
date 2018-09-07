def group_four(index)
  step_four_page.content.form_group[index]
end

Given(/^I am a single person on the step four page$/) do
  step 'I am on the page for step one - form name'
  step 'I submit the form with a valid form number'
  step 'I select no to have you already paid the fee?'
  step 'I click continue'
  step 'I submit the form as single'
end

Given(/^I am a married person on the step four page$/) do
  step 'I am on the page for step one - form name'
  step 'I submit the form with a valid form number'
  step 'I select no to have you already paid the fee?'
  step 'I click continue'
  step 'I submit the form as married'
end

When(/^I submit the form with £0 to £2,999 checked$/) do
  expect(group_four(0)).to have_low_amount
  group_four(0).savings_and_investment_choice_less.click
  common_page.continue_button.click
end

When(/^I submit the form with £3,000 to £15,999 checked$/) do
  expect(group_four(0)).to have_medium_amount
  group_four(0).savings_and_investment_choice_between.click
  common_page.continue_button.click
end

When(/^I submit the form with £16,000 or more checked$/) do
  expect(group_four(0)).to have_high_amount
  group_four(0).savings_and_investment_choice_more.click
  common_page.continue_button.click
end

Then(/^I should see help with savings and investments copy$/) do
  expect(group_four(1)).to have_help_include
  expect(group_four(1)).to have_help_isa
  expect(group_four(1)).to have_help_savings
  expect(group_four(1)).to have_help_bonds
  expect(group_four(1)).to have_help_lump_sum
  expect(group_four(1)).to have_help_stocks_shares
  expect(group_four(1)).to have_help_trust_funds
  expect(group_four(1)).to have_help_homes
  expect(group_four(1)).to have_help_property
  expect(group_four(1)).to have_help_exclude
  expect(group_four(1)).to have_help_wages
  expect(group_four(1)).to have_help_savings
  expect(group_four(1)).to have_help_capital
  expect(group_four(1)).to have_help_student_loans
  expect(group_four(1)).to have_help_dismissal
  expect(group_four(1)).to have_help_injury
  expect(group_four(1)).to have_help_medical_negligence
  expect(group_four(1)).to have_help_compensation
end

Then(/^I should not see the reminder to include my partners savings$/) do
  expect(step_four_page.content).to have_no_married_reminder
end

Then(/^I should see the reminder to include my partners savings$/) do
  expect(step_four_page.content).to have_married_reminder
end
