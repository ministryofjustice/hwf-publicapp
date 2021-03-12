Given(/^I am on the confirmation done page with probate enabled$/) do
  probate_enabled
  to_confirmation_done_page
  expect(confirmation_done_page).to be_displayed
  expect(confirmation_done_page.content).to have_step_info
  expect(confirmation_done_page.content).to have_header
  expect(confirmation_done_page.content).to have_send_your_form
end

When(/^I click the finish application button$/) do
  confirmation_done_page.submit
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
  expect(confirmation_done_page.content).to have_feedback_text
end

Then(/^I should be taken to the survey page$/) do
  survey_url = Rails.application.config.finish_page_redirect_url
  expect(current_path).to eq survey_url
end
