# frozen_string_literal: true
Given(/^I visit the page for step one$/) do
  step_one_page.load_page
end

When(/^I enter a valid form number$/) do
  form_name = step_one_page.content.new_form_name
  form_name.form_group[0].form_name_identifier.set('C100')
  form_name.form_group[4].continue_button.click
end

When(/^I enter a valid form name$/) do
  form_name = step_one_page.content.new_form_name
  form_name.form_group[0].form_name_identifier.set('notice to appeal')
  form_name.form_group[4].continue_button.click
end

When(/^I select I don’t know the form name or number$/) do
  form_name = step_one_page.content.new_form_name eq 'I don’t know the form name or number'
  expect(form_name.form_group[1].form_name_unknown['type']).to eq 'checkbox'
  form_name.form_group[1].form_name_unknown.click
  form_name.form_group[4].continue_button.click
end

When(/^I select I need help with an employment tribunal fee$/) do
  form_name = step_one_page.content.new_form_name
  form_group_two = form_name.form_group[2]
  form_group_two_label = form_group_two.block_label[0].text

  expect(form_group_two_label).to eq 'I need help with an employment tribunal fee'
  expect(form_group_two.form_name_et['type']).to eq 'checkbox'
  form_group_two.form_name_et.click
  form_name.form_group[4].continue_button.click
end

When(/^I open help with form name or number$/) do
  form_group = step_one_page.content.new_form_name.form_group[3]
  expect(form_group.summary.text).to eq 'Help with form name or number'
  form_group.summary.click
end

When(/^I leave the form name or number blank$/) do
  form_group = step_one_page.content.new_form_name.form_group[4]
  form_group.continue_button.click
end

When(/^I click on cancel application$/) do
  restart_app = step_one_page.restart_application
  expect(restart_app['value']).to eq 'Cancel application'
  restart_app.click
end

When(/^I see the are you sure copy$/) do
  confirm = step_one_page.restart_confirm
  expect(confirm.p.count).to eq 2
  expect(confirm.p[0].text).to eq 'Are you sure you want to cancel your application?'
end

When(/^I click on no, return to current application$/) do
  step_one_page.restart_confirm.button[1].click
end

And(/^I click on yes, cancel$/) do
  step_one_page.restart_confirm.button[0].click
end

Then(/^I should remain on the page for step one$/) do
  expect(current_path).to eq '/questions/form_name'
end

Then(/^I am taken to step two$/) do
  expect(step_two_page.content.p.text).to eq 'Step 2 of 20'
end

Then(/^I should see step number$/) do
  expect(step_one_page.content.p.text).to eq 'Step 1 of 20'
end

Then(/^I should see the step one header$/) do
  page_header = step_one_page.content.page_header.text
  expect(page_header).to eq 'What court or tribunal fee do you need help with?'
end

Then(/^I should see step one hint$/) do
  expect(step_one_page.content.hint.text).to have_content 'Enter the court or tribunal form number'
end

Then(/^I should see step one label$/) do
  form_group = step_one_page.content.new_form_name.form_group[0]
  expect(form_group.label.text).to eq 'Form name or number'
end

Then(/^I see error message telling me I need to fix the errors$/) do
  error_summary = step_one_page.content.error_summary
  error_message = step_one_page.content.new_form_name.form_group[0].error_message.text
  expect(error_summary.h2.text).to have_content 'You need to fix the errors'
  expect(error_summary).to have_visuallyhidden
  expect(error_summary.error_link['href']).to end_with '#identifier'
  expect(error_summary.error_link.text).to have_content 'Enter the form name or number'
  expect(error_message).to have_content 'Enter the form name or number'
end

Then(/^I see more information about the form name or number$/) do
  form_group = step_one_page.content.new_form_name.form_group[3]
  expect(form_group.details_content.count).to eq 2
end

Then(/^I should see the please note copy$/) do
  expect(step_one_page.block.count).to eq 2
  expect(step_one_page.block[0].text).to eq 'Please note'
end

Then(/^I am taken to the Help with Fees homepage$/) do
  expect(current_path).to eq '/get-help-with-court-fees'
  expect(step_one_page.content.page_header.text).to eq 'Get help paying court and tribunal fees'
end

Then(/^I should not see the cancel application options$/) do
  expect(step_one_page.restart_confirm.button[0]).to_not be_visible
  expect(step_one_page.restart_confirm.button[1]).to_not be_visible
end
