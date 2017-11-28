def group_seven(index)
  step_seven_page.content.form_group[index]
end

Given(/^I am on the page for step seven$/) do
  step 'I am on the page for step one'
  step 'I submit the form with a valid form number'
  step 'I select no to have you already paid the fee?'
  step 'I click continue'
  step 'I submit the form as single'
  step 'I submit the form with £0 to £2,999 checked'
  step 'I submit the form with no I do not receive one of the benefits listed'
end

When(/^I select yes to do you have any children$/) do
  expect(group_seven(0)).to have_yes
  group_seven(0).dependent_children_true.click
end

When(/^I submit the form with no I do not have any children$/) do
  expect(group_seven(0)).to have_no
  group_seven(0).dependent_children_false.click
  common_page.continue_button.click
end

When(/^I submit the form with '(\d+)' children entered into the input field$/) do |children|
  expect(group_seven(1)).to have_num_of_children
  group_seven(1).children_number.set(children)
  common_page.continue_button.click
end

When(/^I add I have three children$/) do
  step_seven_page.content.form_group[1].children_number.set(3)
  common_page.continue_button.click
end

Then(/^I should see help with financially dependent children copy$/) do
  expect(step_seven_page.content).to have_give_details
  expect(step_seven_page.content).to have_includes_children
  expect(step_seven_page.content).to have_children_under
  expect(step_seven_page.content).to have_children_between
  expect(step_seven_page.content).to have_regular_maintenance
  expect(step_seven_page.content).to have_child_tax_link
end
