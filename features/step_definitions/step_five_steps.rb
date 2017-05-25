Given(/^I am a single person with £3,000 to £15,999 savings/) do
  step 'I visit the page for step one'
  step 'I enter a valid form number'
  step 'I select no to have you already paid the fee?'
  step 'I select single'
  step 'I select £3,000 to £15,999'
end

Given(/^I am a single person with over £16,000 savings$/) do
  step 'I visit the page for step one'
  step 'I enter a valid form number'
  step 'I select no to have you already paid the fee?'
  step 'I select single'
  step 'I select £16,000 or more'
end

Given(/^I am a married person with £3,000 to £15,999 savings$/) do
  step 'I visit the page for step one'
  step 'I enter a valid form number'
  step 'I select no to have you already paid the fee?'
  step 'I select married'
  step 'I select £3,000 to £15,999'
end

When(/^I select yes to are you 61 years old or over\?$/) do
  yes_no_group = step_five_page.content.form_group[0]
  expect(yes_no_group.block_label[0].text).to eq 'Yes'
  yes_no_group.over_61_true.click
  step_five_page.content.form_group[2].continue_button.click
end

When(/^I select no to are you 61 years old or over\?$/) do
  yes_no_group = step_five_page.content.form_group[0]
  expect(yes_no_group.block_label[1].text).to eq 'No'
  yes_no_group.over_61_false.click
  step_five_page.content.form_group[2].continue_button.click
end

When(/^I enter '(\d+)' into the input field$/) do |savings|
  how_much_group = step_five_page.content.form_group[1]
  how_much_group.extra_amount.set(savings)
  step_five_page.content.form_group[2].continue_button.click
end

Then(/^I should be asked '([^\"]*)'$/) do |question|
  how_much_group = step_five_page.content.form_group[1]
  label = how_much_group.how_much_label.text
  expect(label).to have_content question
  expect(how_much_group.extra_amount['type']).to eq 'number'
end
