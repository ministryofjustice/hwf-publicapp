Given(/^I am a single person on kind of income page$/) do
  income_kind_page.to_income_kind_single
  expect(income_kind_page.content).to have_choose_income_single
  expect(income_kind_page.content).to have_step_info
  expect(income_kind_page.content).to have_income_kind_header_single
end

Given(/^I am a married person on kind of income page$/) do
  income_kind_page.to_income_kind_married
  expect(income_kind_page.content).to have_choose_income_married
  expect(income_kind_page.content).to have_step_info
  expect(income_kind_page.content).to have_income_kind_header_married
end

When(/^I submit the form with no income checked$/) do
  income_kind_page.submit_no_income
end

When(/^I submit the form with wages checked$/) do
  income_kind_page.submit_single_income_wages_tax_credit
end

Then(/^I should see an income list:$/) do |incomes|
  incomes.rows.each_with_index do |income, index|
    expect(income_kind_page.content.income_label[index].text).to eq income[0]
    expect(income_kind_page.content.input[index]['type']).to eq 'checkbox'
  end
end

Then(/^I should see an income list for myself and my partner:$/) do |incomes|
  expect(income_kind_page.content.my_income).to have_your_income
  expect(income_kind_page.content).to have_partners_income
  incomes.rows.each_with_index do |income, index|
    expect(income_kind_page.content.income_label[index].text).to eq income[0]
    expect(income_kind_page.content.input[index]['type']).to eq 'checkbox'
  end
  incomes.rows.each_with_index do |income, index|
    expect(income_kind_page.content.income_label[index].text).to eq income[0]
    expect(income_kind_page.content.input[index]['type']).to eq 'checkbox'
  end
end

When(/^I should see select your kinds of income error message$/) do
  expect(common_page.content).to have_there_is_a_problem
  expect(income_kind_page.content).to have_blank_error_message
  expect(income_kind_page.content).to have_blank_error_link
end

Then(/^I should be taken to kind of income page$/) do
  expect(income_kind_page).to be_displayed
end
