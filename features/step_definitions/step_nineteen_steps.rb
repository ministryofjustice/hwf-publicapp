Given(/^I visit the page for step nineteen with probate enabled$/) do
  travel_to a_day_before_disable_probate_fees
  answer_up_to_income_amount_married
  step 'I submit the form with my monthly income'
  probate_page.submit_no
  claim_page.submit_no
  national_insurance_page.submit_valid_ni
  dob_page.valid_dob
  step 'I enter my full name'
  step 'I enter my address with postcode'
  step 'I click continue'
  step 'I click submit application and continue'
end

Then(/^I should see direction points 1 to 4$/) do
  expect(step_nineteen_page.steps_panel.li.count).to eq 4
  expect(step_nineteen_page.steps_panel.hwf_ref.text).to have_content 'HWF-000-000'
end

Then(/^I go to step twenty$/) do
  expect(current_path).to eq '/confirmation/done'
end
