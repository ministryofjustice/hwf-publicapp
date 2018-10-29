Given(/^I visit the page for step sixteen$/) do
  answer_up_to_income_amount_married
  step 'I submit the form with my monthly income'
  step 'I select no to are you paying a fee for a probate case'
  step 'I select no to do you have a case, claim or notice to pay number'
  step 'I enter a valid national insurance number'
  step 'I enter a valid date of birth'
  step 'I enter my full name'
end

When(/^I enter my address with postcode$/) do
  expect(step_sixteen_page.form_group[0].text).to eq 'Address'
  step_sixteen_page.address.set('102 Petty France, London')
  expect(step_sixteen_page.form_group[1].text).to eq 'Postcode'
  step_sixteen_page.postcode.set('SW1H 9AJ')
  common_page.continue_button.click
end

When(/^I enter my address$/) do
  expect(step_sixteen_page.form_group[0].text).to eq 'Address'
  step_sixteen_page.address.set('102 Petty France, London')
  common_page.continue_button.click
end

When(/^I enter my postcode$/) do
  expect(step_sixteen_page.form_group[0].text).to eq 'Address'
  step_sixteen_page.postcode.set('102 Petty France, London')
  common_page.continue_button.click
end
