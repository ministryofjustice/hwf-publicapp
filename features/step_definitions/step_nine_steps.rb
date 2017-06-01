def form_group(index)
  step_nine_page.content.form_group[index]
end

Given(/^I am a single person, no children on step nine$/) do
  step 'I visit the page for step one'
  step 'I enter a valid form number'
  step 'I select no to have you already paid the fee?'
  step 'I select single'
  step 'I select £0 to £2,999'
  step 'I select no to do you receive any of the following benefits?'
  step 'I select no to do you have any children'
  step 'after selecting wages from income list on step eight'
  step 'after selecting working tax credit from income list on step eight'
  step 'I click continue'
end

Given(/^I am a married person, no children on step nine$/) do
  step 'I visit the page for step one'
  step 'I enter a valid form number'
  step 'I select no to have you already paid the fee?'
  step 'I select married'
  step 'I select £0 to £2,999'
  step 'I select no to do you receive any of the following benefits?'
  step 'I select no to do you have any children'
  step 'after selecting wages from income list on step eight'
  step 'I click the continue button'
end

Given(/^I am a married person with three children on step nine$/) do
  step 'I visit the page for step one'
  step 'I enter a valid form number'
  step 'I select no to have you already paid the fee?'
  step 'I select married'
  step 'I select £0 to £2,999'
  step 'I select no to do you receive any of the following benefits?'
  step 'I select yes to do you have any children'
  step 'I add I have three children'
  step 'after selecting wages from income list on step eight'
  step 'I click the continue button'
end

Given(/^I am a single person with three children on step nine$/) do
  step 'I visit the page for step one'
  step 'I enter a valid form number'
  step 'I select no to have you already paid the fee?'
  step 'I select single'
  step 'I select £0 to £2,999'
  step 'I select no to do you receive any of the following benefits?'
  step 'I select yes to do you have any children'
  step 'I add I have three children'
  step 'after selecting wages from income list on step eight'
  step 'I press the continue button'
end

When(/^I select less than$/) do
  your_income = step_nine_page.content.form_group[0]
  your_income.income_range_less.click
  step_nine_page.content.form_group[1].continue_button.click
end

And(/^I select between$/) do
  your_income = step_nine_page.content.form_group[0]
  your_income.income_range_between.click
  step_nine_page.content.form_group[1].continue_button.click
end

When(/^I select more than$/) do
  your_income = step_nine_page.content.form_group[0]
  your_income.income_range_more.click
  step_nine_page.content.form_group[1].continue_button.click
end

And(/^after selecting working tax credit from income list on step eight$/) do
  your_income = step_eight_page.content.form_group[0]
  expect(your_income.block_label[2].text).to eq 'Working Tax Credit'
  your_income.block_label[2].click
end

Then(/^I should see average monthly income copy$/) do
  average_income = step_nine_page.content.text.p[1]
  expect(average_income.text).to have_content 'work out an average monthly income'
end

Then(/^I should see low income range '([^\"]*)'$/) do |income|
  low_income = step_nine_page.content.form_group[0].block_label[0]
  expect(low_income.text).to eq income
end

Then(/^I should see medium income range '([^\"]*)'$/) do |income|
  med_income = step_nine_page.content.form_group[0].block_label[1]
  expect(med_income.text).to eq income
end

Then(/^I should see high income range '([^\"]*)'$/) do |income|
  high_income = step_nine_page.content.form_group[0].block_label[2]
  expect(high_income.text).to eq income
end