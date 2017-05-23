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
  form_name = step_one_page.content.new_form_name
  form_group_one = form_name.form_group[1]
  form_group_one_label = form_group_one.block_label[0].text

  expect(form_group_one_label).to eq 'I don’t know the form name or number'
  expect(form_group_one.form_name_unknown['type']).to eq 'checkbox'
  form_group_one.form_name_unknown.click
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

Then(/^I am taken to step two$/) do
  expect(current_path).to eq '/questions/fee'
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
