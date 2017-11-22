def group_four(index)
  step_four_page.content.form_group[index]
end

Given(/^I am a single person on the step four page$/) do
  step 'I am on the page for step one'
  step 'I submit the form with a valid form number'
  step 'I select no to have you already paid the fee?'
  step 'I click continue'
  step 'I submit the form as single'
end

Given(/^I am a married person on the step four page$/) do
  step 'I am on the page for step one'
  step 'I submit the form with a valid form number'
  step 'I select no to have you already paid the fee?'
  step 'I click continue'
  step 'I submit the form as married'
end

When(/^I submit the form with £0 to £2,999 checked$/) do
  expect(group_four(0).block_label[0].text).to eq '£0 to £2,999'
  expect(group_four(0).savings_and_investment_choice_less['type']).to eq 'radio'
  group_four(0).savings_and_investment_choice_less.click
  common_page.continue_button.click
end

When(/^I submit the form with £3,000 to £15,999 checked$/) do
  expect(group_four(0).block_label[1].text).to eq '£3,000 to £15,999'
  expect(group_four(0).savings_and_investment_choice_between['type']).to eq 'radio'
  group_four(0).savings_and_investment_choice_between.click
  common_page.continue_button.click
end

When(/^I submit the form with £16,000 or more checked$/) do
  expect(group_four(0).block_label[2].text).to eq '£16,000 or more'
  expect(group_four(0).savings_and_investment_choice_more['type']).to eq 'radio'
  group_four(0).savings_and_investment_choice_more.click
  common_page.continue_button.click
end

Then(/^I should see step four label$/) do
  expect(group_four(0).label.text).to eq 'Form name or number'
end

Then(/^I should see help with savings and investments copy$/) do
  first_heading = group_four(1).details_content.heading_small[0].text
  second_heading = group_four(1).details_content.heading_small[1].text

  expect(first_heading).to have_content 'What to include in savings and investments:'
  expect(second_heading).to have_content 'Don’t include the following in your savings total:'
  expect(group_four(1).details_content.ul[0].li.count).to eq 8
  expect(group_four(1).details_content.ul[1].li.count).to eq 9
end

Then(/^I should not see the reminder to include my partners savings$/) do
  expect(step_four_page.content).to have_no_married_reminder
end

Then(/^I should see the reminder to include my partners savings$/) do
  married_reminder = step_four_page.content.married_reminder.text
  expect(married_reminder).to have_content 'include your partner’s savings and investments'
end
