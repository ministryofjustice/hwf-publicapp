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

When(/^I leave the form name or number blank$/) do
  form_group = step_one_page.content.new_form_name.form_group[4]
  form_group.continue_button.click
end

Then(/^I should see step one hint$/) do
  expect(step_one_page.content.hint.text).to have_content 'Enter the court or tribunal form number'
end

Then(/^I should see step one label$/) do
  form_group = step_one_page.content.new_form_name.form_group[0]
  expect(form_group.label.text).to eq 'Form name or number'
end

Then(/^I see more information about the form name or number$/) do
  form_group = step_one_page.content.new_form_name.form_group[3]
  expect(form_group.details_content.count).to eq 2
end
