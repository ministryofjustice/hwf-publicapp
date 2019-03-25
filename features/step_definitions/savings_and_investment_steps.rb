Given(/^I am a single person on the savings and investments page$/) do
  answer_up_to_savings_and_investment_single
  expect(savings_and_investment_page.content).to have_step_info
  expect(savings_and_investment_page.content).to have_fee_header
  expect(savings_and_investment_page.content).to have_no_married_reminder
end

Given(/^I am a married person on the savings and investments page$/) do
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

Then(/^I should be taken to benefits page$/) do
  expect(benefit_page).to be_displayed
end

Then(/^I should be taken to savings and investments page$/) do
  expect(savings_and_investment_page).to be_displayed
end
