def group_five(index)
  step_five_page.content.form_group[index]
end

Given(/^I am a single person with £3,000 to £15,999 savings/) do
  step 'I am on the page for step one'
  step 'I submit the form with a valid form number'
  step 'I select no to have you already paid the fee?'
  step 'I select single'
  step 'I select £3,000 to £15,999'
end

Given(/^I am a single person with over £16,000 savings$/) do
  step 'I am on the page for step one'
  step 'I submit the form with a valid form number'
  step 'I select no to have you already paid the fee?'
  step 'I select single'
  step 'I select £16,000 or more'
end

Given(/^I am a married person with £3,000 to £15,999 savings$/) do
  step 'I am on the page for step one'
  step 'I submit the form with a valid form number'
  step 'I select no to have you already paid the fee?'
  step 'I select married'
  step 'I select £3,000 to £15,999'
end

When(/^I select yes to are you 61 years old or over\?$/) do
  expect(group_five(0).block_label[0].text).to eq 'Yes'
  group_five(0).over_61_true.click
  common_page.continue_button.click
end

When(/^I select no to are you 61 years old or over\?$/) do
  expect(group_five(0).block_label[1].text).to eq 'No'
  group_five(0).over_61_false.click
  common_page.continue_button.click
end

When(/^I enter '(\d+)' into the input field$/) do |savings|
  group_five(1).extra_amount.set(savings)
  common_page.continue_button.click
end

Then(/^I should be asked '([^\"]*)'$/) do |question|
  expect(group_five(1).how_much_label.text).to have_content question
  expect(group_five(1).extra_amount['type']).to eq 'number'
end
