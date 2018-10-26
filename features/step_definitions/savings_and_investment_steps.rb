Given(/^I am a single person on the step four - How much do you have in savings and investments\?$/) do
  answer_up_to_savings_and_investment_single
  expect(savings_and_investment_page.content).to have_step_info
  expect(savings_and_investment_page.content).to have_fee_header
  expect(savings_and_investment_page.content).to have_no_married_reminder
end

Given(/^I am a married person on the step four - How much do you have in savings and investments\?$/) do
  answer_up_to_savings_and_investment_married
  expect(savings_and_investment_page.content).to have_step_info
  expect(savings_and_investment_page.content).to have_fee_header
  expect(savings_and_investment_page.content).to have_married_reminder
end

When(/^I submit the form with £0 to £2,999 checked$/) do
  savings_and_investment_page.low_amount_checked
end

When(/^I submit the form with £3,000 to £15,999 checked$/) do
  savings_and_investment_page.medium_amount_checked
end

When(/^I submit the form with £16,000 or more checked$/) do
  savings_and_investment_page.high_amount_checked
end

Then(/^I should see help with savings and investments copy$/) do
  expect(savings_and_investment_page.content).to have_help_text
end
