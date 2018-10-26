Given(/^I am on the page for step seven - Do you have any children living with you, or who you support financially\?$/) do
  answer_up_to_dependent_single
  expect(dependent_page.content).to have_step_info
  expect(dependent_page.content).to have_dependent_header
end

When(/^I select yes to do you have any children$/) do
  dependent_page.content.yes.click
end

When(/^I submit the form with no I do not have any children$/) do
  dependent_page.content.no.click
  continue
end

When(/^I submit the form with '(\d+)' children$/) do |children|
  expect(dependent_page.content).to have_num_of_children
  dependent_page.content.children_number.set(children)
  continue
end

When(/^I add I have three children$/) do
  dependent_page.content.children_number.set(3)
  continue
end

Then(/^I should see help with financially dependent children copy$/) do
  expect(dependent_page.content).to have_give_details
  expect(dependent_page.content).to have_includes_children
  expect(dependent_page.content).to have_children_under
  expect(dependent_page.content).to have_children_between
  expect(dependent_page.content).to have_regular_maintenance
  expect(dependent_page.content).to have_child_tax_link
end

Then(/^I should see you need to say whether you have financially dependent children error message$/) do
  expect(dependent_page.content).to have_error_link
  expect(dependent_page.content).to have_error_message
end