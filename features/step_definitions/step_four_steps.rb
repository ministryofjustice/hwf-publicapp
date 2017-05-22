Given(/^I visit the page for step four$/) do
  step 'I visit the page for step one'
  step 'I enter a valid form number'
  step 'I select no to have you already paid the fee?'
  step 'I select single'
end

When(/^I select £0 to £2,999$/) do
  from_group_one = step_four_page.content.form_group[0]

  expect(from_group_one.block_label[0].text).to eq '£0 to £2,999'  
  expect(from_group_one.savings_and_investment_choice_less['type']).to eq 'radio'
  from_group_one.savings_and_investment_choice_less.click
  step_three_page.content.form_group[2].continue_button.click
end

When(/^I select £3,000 to £15,999$/) do
  from_group_one = step_four_page.content.form_group[0]

  expect(from_group_one.block_label[1].text).to eq '£3,000 to £15,999'  
  expect(from_group_one.savings_and_investment_choice_between['type']).to eq 'radio'
  from_group_one.savings_and_investment_choice_between.click
  step_three_page.content.form_group[2].continue_button.click
end

When(/^I select £16,000 or more$/) do
  from_group_one = step_four_page.content.form_group[0]

  expect(from_group_one.block_label[2].text).to eq '£16,000 or more'  
  expect(from_group_one.savings_and_investment_choice_more['type']).to eq 'radio'
  from_group_one.savings_and_investment_choice_more.click
  step_three_page.content.form_group[2].continue_button.click
end

When(/^I click on help with savings and investments$/) do
  step_four_page.content.form_group[1].help_with_savings_and_investments.click
end

Then(/^I should see the step four header$/) do
  page_header = step_three_page.content.page_header.text
  expect(page_header).to eq 'How much do you have in savings and investments?'
end

Then(/^I should see step four label$/) do
  form_group = step_one_page.content.new_form_name.form_group[0]
  expect(form_group.label.text).to eq 'Form name or number'
end

Then(/^I am taken to step six$/) do
  expect(current_path).to eq '/questions/benefit'
end

Then(/^I am taken to step five$/) do
  expect(current_path).to eq '/questions/savings_and_investment_extra'
end

Then(/^I should see help with savings and investments copy$/) do
  help_with_status_group = step_three_page.content.form_group[1].details_content
  first_heading = help_with_status_group.heading_small[0].text
  second_heading = help_with_status_group.heading_small[1].text

  expect(first_heading).to have_content 'What to include in savings and investments:'
  expect(second_heading).to have_content 'Don’t include the following in your savings total:'
  expect(help_with_status_group.ul[0].li.count).to eq 8
  expect(help_with_status_group.ul[1].li.count).to eq 9
end


