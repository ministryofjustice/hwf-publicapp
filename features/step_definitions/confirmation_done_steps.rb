Given(/^I am on the confirmation done page with probate enabled$/) do
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
  continue
end

When(/^I click the finish application button$/) do
  confirmation_done_page.finish_application_button.click
end

Then(/^I am taken to the thank you page$/) do
  expect(current_path).to eq '/'
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
