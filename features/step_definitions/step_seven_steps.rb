def group_seven(index)
  step_seven_page.content.form_group[index]
end

Given(/^I visit the page for step seven$/) do
  step 'I am on the page for step one'
  step 'I submit the form with a valid form number'
  step 'I select no to have you already paid the fee?'
  step 'I click continue'
  step 'I submit the form as single'
  step 'I submit the form with £0 to £2,999 checked'
  step 'I submit the form with no I do not receive one of the benefits listed'
end

When(/^I select yes to do you have any children$/) do
  expect(group_seven(0).block_label[1].text).to eq 'Yes'
  group_seven(0).dependent_children_true.click
end

When(/^I select no to do you have any children$/) do
  expect(group_seven(0).block_label[0].text).to eq 'No'
  group_seven(0).dependent_children_false.click
  common_page.continue_button.click
end

When(/^I add I have '(\d+)' children$/) do |children|
  expect(group_seven(1).text).to eq 'Number of children'
  expect(group_seven(1).children_number['type']).to eq 'number'
  group_seven(1).children_number.set(children)
  common_page.continue_button.click
end

When(/^I add I have three children$/) do
  num_children = step_seven_page.content.form_group[1]
  num_children.children_number.set(3)
  common_page.continue_button.click
end

Then(/^I should see help with financially dependent children copy$/) do
  content_group = group_seven(2).details_content

  expect(content_group.p[0].text).to have_content 'You need to give details of any children'
  expect(content_group.p[1].text).to have_content 'This includes children who are:'
  expect(content_group.li.count).to eq 3
  expect(content_group.li[1].external['href']).to eq 'https://www.gov.uk/child-tax-credit-when-child-reaches-16'
end
