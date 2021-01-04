Given(/^I am on the address page with probate enabled$/) do
  probate_enabled
  to_address_page
  expect(address_page.content).to have_step_info
  expect(address_page.content).to have_header
end

When(/^I enter my address with postcode$/) do
  address_page.submit_full_address
end

When(/^I enter my address$/) do
  address_page.address('102 Petty France, London')
end

When(/^I enter my postcode$/) do
  address_page.post_code('SW1H 9AJ')
end

Then(/^I should be taken to address page$/) do
  expect(address_page).to be_displayed
end
