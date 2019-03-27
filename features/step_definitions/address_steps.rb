Given(/^I visit the address page with probate enabled$/) do
  travel_to a_day_before_disable_probate_fees
  puts 'probate is disabled: ' + ProbateFeesSwitch.disable_probate_fees?.to_s
  answer_up_to_income_amount_married
  step 'I submit the form with my monthly income'
  probate_page.submit_no
  claim_page.submit_no
  national_insurance_page.submit_valid_ni
  dob_page.valid_dob
  step 'I enter my full name'
end

When(/^I enter my address with postcode$/) do
  expect(address_page.form_group[0].text).to eq 'Address'
  address_page.address.set('102 Petty France, London')
  expect(address_page.form_group[1].text).to eq 'Postcode'
  address_page.postcode.set('SW1H 9AJ')
  common_page.continue_button.click
end

When(/^I enter my address$/) do
  expect(address_page.form_group[0].text).to eq 'Address'
  address_page.address.set('102 Petty France, London')
  common_page.continue_button.click
end

When(/^I enter my postcode$/) do
  expect(address_page.form_group[0].text).to eq 'Address'
  address_page.postcode.set('102 Petty France, London')
  common_page.continue_button.click
end
