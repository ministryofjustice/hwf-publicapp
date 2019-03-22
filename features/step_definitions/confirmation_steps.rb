Given(/^I visit the confirmation page$/) do
  answer_up_to_income_amount_married
  step 'I submit the form with my monthly income'
  step 'I select no to are you paying a fee for a probate case'
  step 'I select no to do you have a case, claim or notice to pay number'
  step 'I enter a valid national insurance number'
  step 'I enter a valid date of birth'
  step 'I enter my full name'
  step 'I enter my address with postcode'
  step 'I click continue'
  step 'I click submit application and continue'
end

Then(/^I should see direction points 1 to 4$/) do
  expect(confirmation_page.steps_panel.li.count).to eq 4
  expect(confirmation_page.steps_panel.hwf_ref.text).to have_content 'HWF-000-000'
end

Then(/^I should be taken to the confirmation done page$/) do
  expect(confirmation_done_page).to be_displayed
end
