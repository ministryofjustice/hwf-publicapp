def group_one(index)
  step_one_page.content.form_group[index]
end

Given(/^I am on the page for step one$/) do
  step_one_page.load_page
  expect(step_one_page.content).to have_enter_court_hint
end

Then(/^I should see the please note timeout$/) do
  expect(step_one_page.content).to have_please_note
  expect(step_one_page.content).to have_timeout
end

When(/^I submit the form with a valid form number$/) do
  expect(group_one(0)).to have_form_name
  group_one(0).form_name_identifier.set('C100')
  common_page.continue_button.click
end

When(/^I submit the form with a valid form name$/) do
  group_one(0).form_name_identifier.set('notice to appeal')
  common_page.continue_button.click
end

When(/^I submit the form with I don’t know the form name or number checked$/) do
  expect(group_one(1)).to have_form_name_unknown_label
  group_one(1).form_name_unknown.click
  common_page.continue_button.click
end

When(/^I try to submit the form with the form name or number left blank$/) do
  common_page.continue_button.click
end

Then(/^I see more information about the form name or number$/) do
  expect(group_one(2)).to have_find_form_name
  expect(group_one(2)).to have_no_form_name
end
