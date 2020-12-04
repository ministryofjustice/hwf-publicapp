Given(/^I am on the confirmation done page with probate enabled$/) do
  probate_enabled
  to_confirmation_done_page
  expect(confirmation_done_page).to be_displayed
  expect(confirmation_done_page.content).to have_step_info
  expect(confirmation_done_page.content).to have_header
  expect(confirmation_done_page.content).to have_send_your_form
end

When(/^I click the finish application button$/) do
  confirmation_done_page.content.finish_application_button.click
end

Then(/^I should see deliver your paperwork instructions$/) do
  expect(confirmation_done_page.content).to have_post
end

Then(/^I should see what happens next$/) do
  expect(confirmation_done_page.content.what_happens_next).to have_one
  expect(confirmation_done_page.content.what_happens_next).to have_two
  expect(confirmation_done_page.content.what_happens_next).to have_three
end

Then(/^I should be taken to the confirmation done page$/) do
  expect(confirmation_done_page).to be_displayed
end

Then(/^I should be taken to the thank you page$/) do
  expect(current_path).to eq '/'
end
