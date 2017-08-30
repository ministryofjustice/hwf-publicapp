def group_one(index)
  step_one_page.content.new_form_name.form_group[index]
end

Given(/^I visit the page for step one$/) do
  step_one_page.load_page
end

When(/^I enter a valid form number$/) do
  group_one(0).form_name_identifier.set('C100')
  common_page.continue_button.click
end

When(/^I enter a valid form name$/) do
  group_one(0).form_name_identifier.set('notice to appeal')
  common_page.continue_button.click
end

When(/^I select I don’t know the form name or number$/) do
  label = group_one(1).block_label[0]

  expect(label.text).to eq 'I don’t know the form name or number'
  expect(group_one(1).form_name_unknown['type']).to eq 'checkbox'
  group_one(1).form_name_unknown.click
  common_page.continue_button.click
end

When(/^I select I need help with an employment tribunal fee$/) do
  label = group_one(2).block_label[0]

  expect(label.text).to eq 'I need help with an employment tribunal fee'
  expect(group_one(2).form_name_et['type']).to eq 'checkbox'
  group_one(2).form_name_et.click
  common_page.continue_button.click
end

When(/^I leave the form name or number blank$/) do
  common_page.continue_button.click
end

Then(/^I should see step one hint$/) do
  expect(step_one_page.content.hint.text).to have_content 'Enter the court or tribunal form number'
end

Then(/^I should see step one label$/) do
  expect(group_one(0).label.text).to eq 'Form name or number'
end

Then(/^I see more information about the form name or number$/) do
  expect(group_one(3).details_content.count).to eq 2
end
