Given(/^I am on the address page with probate enabled$/) do
  probate_enabled
  address_page.to_address_page
  expect(address_page.content).to have_step_info
  expect(address_page.content).to have_address_header
end

When(/^I enter my address with postcode$/) do
  expect(address_page.content).to have_address
  expect(address_page.content).to have_postcode
  address_page.submit_full_address
end

When(/^I enter my address$/) do
  address_page.address
end

When(/^I enter my postcode$/) do
  address_page.postcode
end

Then(/^I should be taken to address page$/) do
  expect(address_page).to be_displayed
end
