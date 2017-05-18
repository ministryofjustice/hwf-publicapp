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
