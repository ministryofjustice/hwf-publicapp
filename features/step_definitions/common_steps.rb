def group_common(index)
  common_page.content.form_group[index]
end

When(/^I click on cancel application$/) do
  common_page.restart_application.click
end

When(/^I see the are you sure copy$/) do
  expect(common_page.restart_confirm).to have_yes_button
  expect(common_page.restart_confirm).to have_are_you_sure
  expect(common_page.restart_confirm).to have_if_you_cancel
end

When(/^I click on no, return to current application$/) do
  common_page.restart_confirm.no_button.click
end

When(/^I click continue$/) do
  continue
end

When(/^I click on '([^\"]*)'$/) do |help|
  expect(common_page.help_with.text).to have_content help
  common_page.help_with.click
end

And(/^I click on yes, cancel$/) do
  common_page.restart_confirm.yes_button.click
end

Then(/^I should see '([^\"]*)' header$/) do |header|
  expect(common_page.content.h1.text).to have_content header
end

Then(/^I should see header '([^\"]*)'$/) do |header|
  expect(common_page.content.h2.text).to have_content header
end

Then(/^I am taken to the Help with Fees homepage$/) do
  expect(current_path).to eq '/'
end

Then(/^I should see step (\d+) of 20$/) do |step_number|
  expect(common_page.content.p.text).to eq "Step #{step_number} of 20"
end

Then(/^I see step (\d+) of 20$/) do |step_number|
  expect(common_page.heading_secondary.text).to eq "Step #{step_number} of 20"
end

Then(/^I should see the please note copy$/) do
  expect(common_page.block.count).to eq 2
  expect(common_page.block[0].text).to eq 'Please note'
end

Then(/^I should not see the cancel application options$/) do
  expect(common_page).to_not have_restart_confirm
end

Then(/^I should remain on the page$/) do
  expect(current_path).to eq '/questions/form_name'
end

Then(/^I should see hint '([^\"]*)'$/) do |hint|
  hint_group = common_page.content.text.p[0]
  expect(hint_group.text).to have_content hint
end

Then(/^I should see single person hint '([^\"]*)'$/) do |hint|
  hint_group = common_page.content.text.p[0]
  expect(hint_group.text).to have_content hint
end

Then(/^I should see married person hint '([^\"]*)'$/) do |hint|
  hint_group = common_page.content.text.p[0]
  expect(hint_group.text).to have_content hint
end

Then(/^I am taken to step (\d+) - ([^\"]*)$/) do |step, title|
  expect(common_page.content.p.text).to have_content step
  expect(common_page.content.h1.text).to eq title
end

Then(/^I am taken to probate step twelve$/) do
  expect(current_path).to eq '/questions/probate'
end

Then(/^I should see save or print this page$/) do
  expect(common_page.js_print['href']).to end_with '#'
  expect(common_page.js_print.text).to eq 'Save or print this page'
end

Then(/^I should see '([^\"]*)' error message$/) do |error_message|
  error_summary_group = common_page.error_summary
  expect(error_summary_group).to have_error_summary_heading
  expect(error_summary_group.link.text).to have_content error_message
  expect(common_page.error_message[0].text).to have_content error_message
end

Then(/^I should see error message '([^\"]*)'$/) do |error_message|
  error_summary_group = common_page.error_summary
  expect(error_summary_group).to have_error_summary_heading
  expect(error_summary_group.link.text).to have_content error_message
  expect(common_page.error_message[1].text).to have_content error_message
end

Then(/^I should see average monthly income copy$/) do
  average_income = common_page.content.text.p[1]
  expect(average_income.text).to have_content 'work out an average monthly income'
end
