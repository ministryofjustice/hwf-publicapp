Then(/^I should see '([^\"]*)' header$/) do |header|
  page_header = common_page.content.page_header.text
  expect(page_header).to have_content header
end

When(/^I click on cancel application$/) do
  restart_app = common_page.restart_application
  expect(restart_app['value']).to eq 'Cancel application'
  restart_app.click
end

When(/^I see the are you sure copy$/) do
  confirm = common_page.restart_confirm
  expect(confirm.p.count).to eq 2
  expect(confirm.p[0].text).to eq 'Are you sure you want to cancel your application?'
end

When(/^I click on no, return to current application$/) do
  common_page.restart_confirm.button[1].click
end

When(/^I click the continue button$/) do
  common_page.content.form_group[2].continue_button.click
end

When(/^I click on help with '([^\"]*)'$/) do |help|
  help_with = common_page.content.form_group[1].help_with
  expect(help_with.text).to have_content help
  help_with.click
end

When(/^I click on '([^\"]*)'$/) do |help|
  help_with = common_page.content.form_group[3].help_with
  expect(help_with.text).to have_content help
  help_with.click
end

And(/^I click on yes, cancel$/) do
  common_page.restart_confirm.button[0].click
end

Then(/^I am taken to the Help with Fees homepage$/) do
  expect(current_path).to eq '/'
end

Then(/^I should see step '(\d+)' of 20$/) do |step_number|
  expect(common_page.content.p.text).to have_content 'Step ' + step_number + ' of 20'
end

Then(/^I should see the please note copy$/) do
  expect(common_page.block.count).to eq 2
  expect(common_page.block[0].text).to eq 'Please note'
end

Then(/^I should not see the cancel application options$/) do
  expect(common_page.restart_confirm.button[0]).to_not be_visible
  expect(common_page.restart_confirm.button[1]).to_not be_visible
end

Then(/^I should remain on the page$/) do
  expect(current_path).to eq '/questions/form_name'
end

Then(/^I should see '([^\"]*)' error message$/) do |error_message|
  error_summary_group = common_page.error_summary
  expect(error_summary_group).to have_error_summary_heading
  expect(error_summary_group.link.text).to have_content error_message
  expect(common_page.error_message.text).to have_content error_message
end

Then(/^I am taken to step two$/) do
  expect(current_path).to eq '/questions/fee'
end

Then(/^I am taken to step three$/) do
  expect(current_path).to eq '/questions/marital_status'
end

Then(/^I am taken to step four$/) do
  expect(current_path).to eq '/questions/savings_and_investment'
end

Then(/^I am taken to step five$/) do
  expect(current_path).to eq '/questions/savings_and_investment_extra'
end

Then(/^I am taken to step six$/) do
  expect(current_path).to eq '/questions/benefit'
end

Then(/^I am taken to step seven$/) do
  expect(current_path).to eq '/questions/dependent'
end

Then(/^I am taken to step eleven$/) do
  expect(current_path).to eq '/questions/probate'
end
