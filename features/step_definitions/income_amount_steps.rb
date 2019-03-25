Given(/^I am a single person on step ten - Whats your total monthly income\?$/) do
  answer_up_to_income_amount_single
  expect(income_amount_page.content).to have_step_info
  expect(income_amount_page.content).to have_income_amount_single_header
  expect(income_amount_page.content).to have_hint_text_single
  expect(income_amount_page.content).to have_average_income_hint
end

Given(/^I am a married person on step ten - Whats your total monthly income\?$/) do
  answer_up_to_income_amount_married
  expect(income_amount_page.content).to have_step_info
  expect(income_amount_page.content).to have_income_amount_married_header
  expect(income_amount_page.content).to have_hint_text_married
  expect(income_amount_page.content).to have_average_income_hint
end

When(/^I submit the form with my monthly income$/) do
  income_amount_page.content.income_amount.set(1900)
  continue
end

Then(/^I should see the income list on step ten page:$/) do |incomes|
  your_income = income_amount_page.content.text
  incomes.rows.each_with_index do |income, index|
    expect(your_income.li[index].text).to eq income[0]
  end
end

Then(/^I should see enter how much income do you receive error message$/) do
  expect(income_amount_page.content).to have_blank_error_link
  expect(income_amount_page.content).to have_blank_error_message
end

Then(/^I should be taken to income amount page$/) do
  expect(income_amount_page).to be_displayed
end
