Given(/^I visit the page for step seven$/) do
  step 'I visit the page for step one'
  step 'I enter a valid form number'
  step 'I select no to have you already paid the fee?'
  step 'I select single'
  step 'I select £0 to £2,999'
  step 'I select no to do you receive any of the following benefits?'
end

When(/^I select yes to do you have any children$/) do
  yes_no_group = step_seven_page.content.form_group[0]
  expect(yes_no_group.block_label[1].text).to eq 'Yes'
  yes_no_group.dependent_children_true.click
end

When(/^I select no to do you have any children$/) do
  yes_no_group = step_seven_page.content.form_group[0]
  expect(yes_no_group.block_label[0].text).to eq 'No'
  yes_no_group.dependent_children_false.click
  step_seven_page.content.continue_button.click
end

When(/^I add I have '(\d+)' children$/) do |children|
  num_children = step_seven_page.content.form_group[1]
  expect(num_children.text).to eq 'Number of children'
  expect(num_children.children_number['type']).to eq 'number'
  num_children.children_number.set(children)
  step_seven_page.content.continue_button.click
end

Then(/^I should see help with financially dependent children copy$/) do
  help_with_status_group = step_seven_page.content.form_group[2].details_content
  first_p = help_with_status_group.p[0].text
  second_p = help_with_status_group.p[1].text

  expect(first_p).to have_content 'You need to give details of any children you support'
  expect(second_p).to have_content 'This includes children who are:'
  expect(help_with_status_group.li.count).to eq 3
  expect(help_with_status_group.li[1].external['href']).to eq 'https://www.gov.uk/child-tax-credit-when-child-reaches-16'
end
