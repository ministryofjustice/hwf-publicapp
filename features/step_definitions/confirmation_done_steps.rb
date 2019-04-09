Given(/^I am on the confirmation done page with probate enabled$/) do
  probate_enabled
  confirmation_done_page.to_confirmation_done_page
  continue
end

When(/^I click the finish application button$/) do
  confirmation_done_page.finish_application_button.click
end

Then(/^I should see deliver your paperwork copy$/) do
  expect(confirmation_done_page.post.p.text).to have_content 'Deliver your paperwork to the court'
end

Then(/^I should see what happens next$/) do
  expect(confirmation_done_page.steps_panel.h2.text).to eq 'What happens next?'
  expect(confirmation_done_page.steps_panel.li.count).to eq 3
end

Then(/^I should see point 1 with HWF number$/) do
  expect(confirmation_done_page.li[0].text).to have_content 'reference number HWF-000-000'
end

Then(/^I should be taken to the confirmation done page$/) do
  expect(confirmation_done_page).to be_displayed
end

Then(/^I should be taken to the thank you page$/) do
  expect(current_path).to eq '/'
end
