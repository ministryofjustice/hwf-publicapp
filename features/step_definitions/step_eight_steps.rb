def group_eight(index)
  step_eight_page.content.form_group[index]
end

Given(/^I am a single person on step eight$/) do
  step 'I am on the page for step one'
  step 'I submit the form with a valid form number'
  step 'I select no to have you already paid the fee?'
  step 'I select single'
  step 'I select £0 to £2,999'
  step 'I select no to do you receive any of the following benefits?'
  step 'I select no to do you have any children'
end

Given(/^I am a married person on step eight$/) do
  step 'I am on the page for step one'
  step 'I submit the form with a valid form number'
  step 'I select no to have you already paid the fee?'
  step 'I select married'
  step 'I select £0 to £2,999'
  step 'I select no to do you receive any of the following benefits?'
  step 'I select no to do you have any children'
end

When(/^I select wages from income list$/) do
  expect(group_eight(0).block_label[0].text).to eq 'Wages'
  group_eight(0).block_label[0].click
end

And(/^I select working tax credit from income list$/) do
  expect(group_eight(0).block_label[2].text).to eq 'Working Tax Credit'
  group_eight(0).block_label[2].click
  common_page.continue_button.click
end

When(/^I select no income$/) do
  group_eight(0).input[12].click
  common_page.continue_button.click
end

When(/^after selecting wages from income list on step eight$/) do
  your_income = step_eight_page.content.form_group[0]
  expect(your_income.block_label[0].text).to eq 'Wages'
  your_income.block_label[0].click
end

Then(/^I should see an income list:$/) do |incomes|
  your_income = step_eight_page.content.form_group[0]
  incomes.rows.each_with_index do |income, index|
    expect(your_income.block_label[index].text).to eq income[0]
    expect(your_income.input[index]['type']).to eq 'checkbox'
  end
end

Then(/^I should see an income list for myself and my partner:$/) do |incomes|
  expect(group_eight(0).h3.text).to eq 'Your income'
  expect(group_eight(1).h3.text).to eq 'Your partner\'s income'
  incomes.rows.each_with_index do |income, index|
    expect(group_eight(0).block_label[index].text).to eq income[0]
    expect(group_eight(0).input[index]['type']).to eq 'checkbox'
  end
  incomes.rows.each_with_index do |income, index|
    expect(group_eight(1).block_label[index].text).to eq income[0]
    expect(group_eight(1).input[index]['type']).to eq 'checkbox'
  end
end

Then(/^I should see the income list on step nine page:$/) do |incomes|
  your_income = step_nine_page.content.text
  incomes.rows.each_with_index do |income, index|
    expect(your_income.li[index].text).to eq income[0]
  end
end
