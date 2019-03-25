Given(/^I am a single person with no children on income range page$/) do
  answer_up_to_income_range_single_no_children
  expect(income_range_page.content).to have_step_info
  expect(income_range_page.content).to have_income_range_header_single
  expect(income_range_page.content).to have_select_single_income_hint
end

Given(/^I am a married person with no children on income range page$/) do
  answer_up_to_income_range_married_no_children
  expect(income_range_page.content).to have_step_info
  expect(income_range_page.content).to have_income_range_header_married
  expect(income_range_page.content).to have_select_married_income_hint
end

Given(/^I am a married person with three children on income range page$/) do
  answer_up_to_income_range_married_with_children
  expect(income_range_page.content).to have_step_info
  expect(income_range_page.content).to have_income_range_header_married
  expect(income_range_page.content).to have_select_married_income_hint
end

Given(/^I am a single person with three children on income range page$/) do
  answer_up_to_income_range_single_with_children
end

When(/^I select less than$/) do
  income_range_page.content.income_range_less.click
  common_page.continue_button.click
end

And(/^I select between$/) do
  income_range_page.content.income_range_between.click
  common_page.continue_button.click
end

When(/^I select more than$/) do
  income_range_page.content.income_range_more.click
  common_page.continue_button.click
end

And(/^after selecting working tax credit from income list on step eight$/) do
  expect(income_kind_page.content.income_label[2].text).to eq 'Working Tax Credit'
  income_range_page.content.income_label[2].click
end

Then(/^I should see low income range '([^\"]*)'$/) do |income|
  expect(income_range_page.content.income_label[0].text).to eq income
end

Then(/^I should see medium income range '([^\"]*)'$/) do |income|
  expect(income_range_page.content.income_label[1].text).to eq income
end

Then(/^I should see high income range '([^\"]*)'$/) do |income|
  expect(income_range_page.content.income_label[2].text).to eq income
end

Then(/^I should see the income list on step nine page:$/) do |incomes|
  incomes.rows.each_with_index do |income, index|
    expect(income_range_page.content.li[index].text).to eq income[0]
  end
end

Then(/^I should see select your monthly income error message$/) do
  expect(income_range_page.content).to have_blank_error_message
  expect(income_range_page.content).to have_blank_error_link
end
