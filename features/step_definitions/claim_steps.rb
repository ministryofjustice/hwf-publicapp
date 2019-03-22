Given(/^I am on the claim page$/) do
  answer_up_to_claim_page
  expect(claim_page.content).to have_step_info
  expect(claim_page.content).to have_claim_header
  expect(claim_page.content).to have_claim_text
end

When(/^I select no to do you have a case, claim or notice to pay number$/) do
  claim_page.content.no.click
  continue
end

When(/^I select yes to do you have a case, claim or notice to pay number$/) do
  claim_page.content.yes.click
end

When(/^I enter a case, claim or notice to pay number$/) do
  expect(claim_page.content).to have_claim_number_label
  claim_page.content.claim_input_field.set('012345678')
  continue
end

Then(/^I should see help with case number copy$/) do
  expect(claim_page.content).to have_creates_reference_number_copy
  expect(claim_page.content).to have_ongoing_case_copy
  expect(claim_page.content).to have_dont_have_reference_number_copy
end

Then(/^I should see enter a case, claim or ‘notice to pay’ number error message$/) do
  expect(claim_page.content).to have_enter_number_error_message
  expect(claim_page.content).to have_enter_number_error_link
end

Then(/^I should see select whether you have a case, claim or ‘notice to pay’ error message$/) do
  expect(claim_page.content).to have_blank_error_message
  expect(claim_page.content).to have_blank_error_link
end

Then(/^I should be taken to national insurance page$/) do
  expect(national_insurance_page).to be_displayed
end
