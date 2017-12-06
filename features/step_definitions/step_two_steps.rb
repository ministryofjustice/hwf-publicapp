def group_two(index)
  step_two_page.content.form_group[index]
end

Given(/^I am on the page for step two$/) do
  step 'I am on the page for step one'
  step 'I submit the form with a valid form number'
  expect(step_two_page.content).to have_apply_for_refund
end

When(/^I select no to have you already paid the fee\?$/) do
  expect(group_two(0)).to have_no
  group_two(0).fee_paid_false.click
end

When(/^I select yes to have you already paid the fee\?$/) do
  expect(group_two(0)).to have_yes
  group_two(0).fee_paid_true.click
end

And(/^I submit the form with a date thats within the last three months$/) do
  expect(group_two(1)).to have_date_fee_paid
  expect(group_two(1)).to have_use_this_date
  group_two(1).fee_date_paid.set(Time.zone.today - 1.month)
  common_page.continue_button.click
end

And(/^I submit the form with a date that exceeds three months$/) do
  group_two(1).fee_date_paid.set(Time.zone.today - 4.months)
  common_page.continue_button.click
end

When(/^I submit the form with a future date$/) do
  group_two(1).fee_date_paid.set(Time.zone.today + 1.month)
  common_page.continue_button.click
end
