def form_group_3(index)
  step_three_page.content.form_group[index]
end

Given(/^I visit the page for step three$/) do
  step 'I visit the page for step one'
  step 'I enter a valid form number'
  step 'I select no to have you already paid the fee?'
end

When(/^I select single$/) do
  expect(form_group_3(0).block_label[0].text).to eq 'Single'
  expect(form_group_3(0).marital_status_married_false['type']).to eq 'radio'
  form_group_3(0).marital_status_married_false.click
  form_group_3(2).continue_button.click
end

When(/^I select married$/) do
  expect(form_group_3(0).block_label[1].text).to have_content 'Married'
  expect(form_group_3(0).marital_status_married_true['type']).to eq 'radio'
  form_group_3(0).marital_status_married_true.click
  form_group_3(2).continue_button.click
end

Then(/^I should see step three label$/) do
  expect(form_group_3(0).label.text).to eq 'Form name or number'
end

Then(/^I should see help with status copy$/) do
  first_heading = form_group_3(1).details_content.heading_small[0]
  second_heading = form_group_3(1).details_content.heading_small[1]

  expect(first_heading.text).to have_content 'Choose ‘married or living with someone'
  expect(second_heading.text).to have_content 'Choose ‘single’'
  expect(form_group_3(1).details_content.ul[0].li.count).to eq 5
  expect(form_group_3(1).details_content.ul[1].li.count).to eq 5
end
