def form_group_7(index)
  step_seven_page.content.form_group[index]
end

Given(/^I visit the page for step seven$/) do
  step 'I visit the page for step one'
  step 'I enter a valid form number'
  step 'I select no to have you already paid the fee?'
  step 'I select single'
  step 'I select £0 to £2,999'
  step 'I select no to do you receive any of the following benefits?'
end

When(/^I select yes to do you have any children$/) do
  expect(form_group_7(0).block_label[1].text).to eq 'Yes'
  form_group_7(0).dependent_children_true.click
end

When(/^I select no to do you have any children$/) do
  expect(form_group_7(0).block_label[0].text).to eq 'No'
  form_group_7(0).dependent_children_false.click
  step_seven_page.content.continue_button.click
end

When(/^I add I have '(\d+)' children$/) do |children|
  expect(form_group_7(1).text).to eq 'Number of children'
  expect(form_group_7(1).children_number['type']).to eq 'number'
  form_group_7(1).children_number.set(children)
  step_seven_page.content.continue_button.click
end

Then(/^I should see help with financially dependent children copy$/) do
  content_group = form_group_7(2).details_content

  expect(content_group.p[0].text).to have_content 'You need to give details of any children'
  expect(content_group.p[1].text).to have_content 'This includes children who are:'
  expect(content_group.li.count).to eq 3
  expect(content_group.li[1].external['href']).to eq 'https://www.gov.uk/child-tax-credit-when-child-reaches-16'
end
