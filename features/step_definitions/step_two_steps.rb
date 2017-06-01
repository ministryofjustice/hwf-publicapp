def form_group_2(index)
  step_two_page.content.form_group[index]
end

Given(/^I visit the page for step two$/) do
  step 'I visit the page for step one'
  step 'I enter a valid form number'
end

When(/^I select no to have you already paid the fee\?$/) do
  expect(step_two_page.content.block_label[0].text).to eq 'No'
  form_group_2(0).fee_paid_false.click
  form_group_2(2).continue_button.click
end

When(/^I select yes to have you already paid the fee\?$/) do
  expect(step_two_page.content.block_label[1].text).to eq 'Yes'
  form_group_2(0).fee_paid_true.click
end

Then(/^I should see step two hint$/) do
  expect(step_two_page.content.text.p.text).to have_content 'apply for a refund for a fee paid'
end

And(/^the date I enter is within the last three months$/) do
  expect(form_group_2(1).form_label.text).to eq 'Date fee paid'
  expect(form_group_2(1).hint.text).to eq 'Use this format D D / M M / Y Y Y Y'
  form_group_2(1).fee_date_paid.set(Time.zone.today - 1.month)
  form_group_2(2).continue_button.click
end

And(/^the date I enter exceeds three months$/) do
  form_group_2(1).fee_date_paid.set(Time.zone.today - 4.months)
  form_group_2(2).continue_button.click
end

When(/^the date I enter is in the future$/) do
  form_group_2(1).fee_date_paid.set(Time.zone.today + 1.month)
  form_group_2(2).continue_button.click
end
