def group_eight(index)
  step_eight_page.content.form_group[index]
end

Given(/^I am a single person on step eight$/) do
  step 'I am on the page for step one - form name'
  step 'I submit the form with a valid form number'
  step 'I select no to have you already paid the fee?'
  step 'I click continue'
  step 'I submit the form as single'
  step 'I submit the form with £0 to £2,999 checked'
  step 'I submit the form with no I do not receive one of the benefits listed'
  step 'I submit the form with no I do not have any children'
  expect(step_eight_page.content).to have_choose_income_single
end

Given(/^I am a married person on step eight$/) do
  step 'I am on the page for step one - form name'
  step 'I submit the form with a valid form number'
  step 'I select no to have you already paid the fee?'
  step 'I click continue'
  step 'I submit the form as married'
  step 'I submit the form with £0 to £2,999 checked'
  step 'I submit the form with no I do not receive one of the benefits listed'
  step 'I submit the form with no I do not have any children'
  expect(step_eight_page.content).to have_choose_income_married
end

When(/^I submit the form with no income checked$/) do
  group_eight(0).no_income.click
  common_page.continue_button.click
end

When(/^after selecting wages from income list on step eight$/) do
  group_eight(0).wages.click
end

Then(/^I should see an income list:$/) do |incomes|
  your_income = step_eight_page.content.form_group[0]
  incomes.rows.each_with_index do |income, index|
    expect(your_income.block_label[index].text).to eq income[0]
    expect(your_income.input[index]['type']).to eq 'checkbox'
  end
end

Then(/^I should see an income list for myself and my partner:$/) do |incomes|
  expect(group_eight(0)).to have_your_income
  expect(group_eight(1)).to have_partners_income
  incomes.rows.each_with_index do |income, index|
    expect(group_eight(0).block_label[index].text).to eq income[0]
    expect(group_eight(0).input[index]['type']).to eq 'checkbox'
  end
  incomes.rows.each_with_index do |income, index|
    expect(group_eight(1).block_label[index].text).to eq income[0]
    expect(group_eight(1).input[index]['type']).to eq 'checkbox'
  end
end
