Given(/^I visit the page for step two$/) do
  step 'I visit the page for step one'
  step 'I enter a valid form number'
  step 'I am taken to step two'
end

When(/^I select no to have you already paid the fee\?$/) do
  expect(step_two_page.content.block_label[0].text).to eq 'No'
  step_two_page.content.form_group[0].fee_paid_false.click
  step_two_page.content.form_group[2].continue_button.click
end

When(/^I select yes to have you already paid the fee\?$/) do
  expect(step_two_page.content.block_label[1].text).to eq 'Yes'
  step_two_page.content.form_group[0].fee_paid_true.click
end

When(/^I click the continue button$/) do
  step_two_page.content.form_group[2].continue_button.click
end

Then(/^I should see the step two header$/) do
  expect(step_one_page.content.page_header.text).to eq 'Have you already paid the fee?'
end

Then(/^I should see step two hint$/) do
  expect(step_two_page.content.text.p.text).to have_content 'apply for a refund for a fee paid'
end

Then(/^I am taken to step three$/) do
  expect(current_path).to eq '/questions/marital_status'
end

Then(/^I should see date exceeding 3 months error message$/) do
  error_summary_group = step_two_page.content.error_summary
  expect(error_summary_group).to have_error_summary_heading
  expect(error_summary_group.link.text).to have_content 'must have been made in the last 3 months'
  expect(error_summary_group.link['href']).to end_with '#date_paid'
end

Then(/^I should see error message prompting a date$/) do
  error_summary_group = step_two_page.content.error_summary
  expect(error_summary_group.link.text).to eq 'Enter the date in this format DD/MM/YYYY'
end

Then(/^I should see error message prompting me to make a selection$/) do
  error_summary_group = step_two_page.content.error_summary
  expect(error_summary_group.link.text).to eq 'Select whether you\'ve already paid the fee'
end

Then(/^I should see date can't be in the future error message$/) do
  error_summary_group = step_two_page.content.error_summary
  expect(error_summary_group.link.text).to eq 'This date can\'t be in the future'
end

And(/^the date I enter is within the last three months$/) do
  fee_date_paid_group = step_two_page.content.form_group[1]
  expect(fee_date_paid_group.form_label.text).to eq 'Date fee paid'
  expect(fee_date_paid_group.hint.text).to eq 'Use this format D D / M M / Y Y Y Y'
  fee_date_paid_group.fee_date_paid.set(Time.zone.today - 1.month)
  step_two_page.content.form_group[2].continue_button.click
end

And(/^the date I enter exceeds three months$/) do
  fee_date_paid_group = step_two_page.content.form_group[1]
  fee_date_paid_group.fee_date_paid.set(Time.zone.today - 4.month)
  step_two_page.content.form_group[2].continue_button.click
end

When(/^the date I enter is in the future$/) do
  fee_date_paid_group = step_two_page.content.form_group[1]
  fee_date_paid_group.fee_date_paid.set(Time.zone.today + 1.month)
  step_two_page.content.form_group[2].continue_button.click
end
