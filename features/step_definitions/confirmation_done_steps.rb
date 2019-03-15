Given(/^I am on the confirmation done page$/) do
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
