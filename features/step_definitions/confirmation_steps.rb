Given(/^I am on the confirmation page with probate enabled$/) do
  probate_enabled
  confirmation_page.to_confirmation_page
  expect(confirmation_page).to be_displayed
  expect(confirmation_page).to have_step_info
  expect(confirmation_page).to have_confirmation_header
end

Then(/^I should see instruction points$/) do
  expect(confirmation_page.list).to have_one
  expect(confirmation_page.list).to have_two
  expect(confirmation_page.list).to have_three
end

When(/^I see letter template$/) do
  expect(confirmation_page).to have_letter_hint
  expect(confirmation_page).to have_letter_template
end

Then(/^I should see reference number$/) do
  expect(confirmation_page).to have_hwf_reference
end

Then(/^I should see warning notice$/) do
  expect(confirmation_page).to have_warning_notice
end

Then(/^I should be taken to confirmation page$/) do
  expect(confirmation_page).to be_displayed
end

When(/^I click finish application$/) do
  confirmation_page.finish_application
end
