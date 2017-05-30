Given(/^I am a single person on step eight$/) do
  step 'I visit the page for step one'
  step 'I enter a valid form number'
  step 'I select no to have you already paid the fee?'
  step 'I select single'
  step 'I select £0 to £2,999'
  step 'I select no to do you receive any of the following benefits?'
  step 'I select no to do you have any children'
end

Given(/^I am a married person on step eight$/) do
  step 'I visit the page for step one'
  step 'I enter a valid form number'
  step 'I select no to have you already paid the fee?'
  step 'I select married'
  step 'I select £0 to £2,999'
  step 'I select no to do you receive any of the following benefits?'
  step 'I select no to do you have any children'
end

When(/^I select wages from income list$/) do
  your_income = step_eight_page.content.form_group[0]
  expect(your_income.block_label[0].text).to eq 'Wages'
  your_income.block_label[0].click
end

And(/^I select working tax credit from income list$/) do
  your_income = step_eight_page.content.form_group[0]
  expect(your_income.block_label[2].text).to eq 'Working Tax Credit'
  your_income.block_label[2].click
  step_eight_page.content.form_group[1].continue_button.click
end

When(/^I select no income$/) do
  your_income = step_eight_page.content.form_group[0]
  your_income.input[12].click
  step_eight_page.content.form_group[1].continue_button.click
end

Then(/^I should see single person hint$/) do
  hint_group = step_eight_page.content.text.p
  expect(hint_group.text).to eq 'Choose the different types of income you receive.'
end

Then(/^I should see married person hint$/) do
  hint_group = step_eight_page.content.text.p
  expect(hint_group.text).to eq 'Choose the different types of income you and your partner receive.'
end

Then(/^I should see an income list for myself and my partner:$/) do |incomes|
  your_income = step_eight_page.content.form_group[0]
  partner_income = step_eight_page.content.form_group[1]

  expect(your_income.h3.text).to eq 'Your income'
  expect(partner_income.h3.text).to eq 'Your partner\'s income'
  incomes.rows.each_with_index do |income, index|
    expect(your_income.block_label[index].text).to eq income[0]
    expect(your_income.input[index]['type']).to eq 'checkbox'
  end
  incomes.rows.each_with_index do |income, index|
    expect(partner_income.block_label[index].text).to eq income[0]
    expect(partner_income.input[index]['type']).to eq 'checkbox'
  end
end

Then(/^I should see the income list on step nine page:$/) do |incomes|
  your_income = step_nine_page.content.text
  incomes.rows.each_with_index do |income, index|
    expect(your_income.li[index].text).to eq income[0]
  end
end
