def group_five(index)
  step_five_page.content.form_group[index]
end

Given(/^I am on the page for step five$/) do
  step 'I am on the page for step one - form name'
  step 'I submit the form with a valid form number'
  step 'I select no to have you already paid the fee?'
  step 'I click continue'
  step 'I submit the form as single'
  step 'I submit the form with £3,000 to £15,999 checked'
end

Given(/^I am a single person$/) do
  step 'I am on the page for step one - form name'
  step 'I submit the form with a valid form number'
  step 'I select no to have you already paid the fee?'
  step 'I click continue'
  step 'I submit the form as single'
end

Given(/^I am a married person$/) do
  step 'I am on the page for step one - form name'
  step 'I submit the form with a valid form number'
  step 'I select no to have you already paid the fee?'
  step 'I click continue'
  step 'I submit the form as married'
end

And(/^I am on the page for step five with £3,000 to £15,999 in savings$/) do
  step 'I submit the form with £3,000 to £15,999 checked'
end

When(/^I select yes to are you 61 years old or over\?$/) do
  expect(group_five(0)).to have_yes
  group_five(0).over_61_true.click
end

When(/^I select no to are you 61 years old or over\?$/) do
  expect(group_five(0)).to have_no
  group_five(0).over_61_false.click
end

When(/^I enter '(\d+)' into the input field$/) do |savings|
  group_five(1).extra_amount.set(savings)
end

Then(/^I should be asked '([^\"]*)'$/) do |question|
  expect(group_five(1).how_much_label.text).to have_content question
  expect(group_five(1).extra_amount['type']).to eq 'number'
end
