def group_one(index)
  step_one_page.content.new_form_name.form_group[index]
end

Given(/^I am on the page for step one$/) do
  step_one_page.load_page
end

When(/^I submit the form with a valid form number$/) do
  group_one(0).form_name_identifier.set('C100')
  common_page.continue_button.click
end

When(/^I submit the form with a valid form name$/) do
  group_one(0).form_name_identifier.set('notice to appeal')
  common_page.continue_button.click
end

When(/^I submit the form with I don’t know the form name or number checked$/) do
  label = group_one(1).block_label[0]

  expect(label.text).to eq 'I don’t know the form name or number'
  expect(group_one(1).form_name_unknown['type']).to eq 'checkbox'
  group_one(1).form_name_unknown.click
  common_page.continue_button.click
end

When(/^I try to submit the form with the form name or number left blank$/) do
  common_page.continue_button.click
end

Then(/^I should see page one hint '([^\"]*)'$/) do |hint|
  expect(step_one_page.content.hint.text).to have_content hint
end

Then(/^I should see form label '([^\"]*)'$/) do |label|
  expect(group_one(0).label.text).to eq label
end

Then(/^I see more information about the form name or number$/) do
  expect(group_one(2).details_content.count).to eq 2
end
