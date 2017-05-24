Given(/^I visit the page for step three$/) do
  step 'I visit the page for step one'
  step 'I enter a valid form number'
  step 'I am taken to step two'
  step 'I select no to have you already paid the fee?'
end

When(/^I select single$/) do
  from_group_one = step_three_page.content.form_group[0]

  expect(from_group_one.block_label[0].text).to eq 'Single'
  expect(from_group_one.marital_status_married_false['type']).to eq 'radio'
  from_group_one.marital_status_married_false.click
  step_three_page.content.form_group[2].continue_button.click
end

When(/^I select married$/) do
  from_group_one = step_three_page.content.form_group[0]

  expect(from_group_one.block_label[1].text).to have_content 'Married'
  expect(from_group_one.marital_status_married_true['type']).to eq 'radio'
  from_group_one.marital_status_married_true.click
  step_three_page.content.form_group[2].continue_button.click
end

Then(/^I should see the step three header$/) do
  page_header = step_three_page.content.page_header.text
  expect(page_header).to eq 'Are you single, married or living with someone and sharing an income?'
end

Then(/^I should see step three label$/) do
  form_group = step_one_page.content.new_form_name.form_group[0]
  expect(form_group.label.text).to eq 'Form name or number'
end

Then(/^I am taken to step four$/) do
  expect(current_path).to eq '/questions/savings_and_investment'
end

When(/^I click on help with status$/) do
  step_three_page.content.form_group[1].help_with_status_button.click
end

Then(/^I should see help with status copy$/) do
  help_with_status_group = step_three_page.content.form_group[1].details_content
  first_heading = help_with_status_group.heading_small[0].text
  second_heading = help_with_status_group.heading_small[1].text

  expect(first_heading).to have_content 'Choose ‘married or living with someone'
  expect(second_heading).to have_content 'Choose ‘single’'
  expect(help_with_status_group.ul[0].li.count).to eq 5
  expect(help_with_status_group.ul[1].li.count).to eq 5
end
