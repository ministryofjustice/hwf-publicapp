Given(/^I visit the page for step eighteen$/) do
  answer_up_to_income_amount_married
  step 'I submit the form with my monthly income'
  claim_page.submit_no
  national_insurance_page.submit_valid_ni
  dob_page.valid_dob
  step 'I enter my full name'
  step 'I enter my address with postcode'
  step 'I click continue'
end

Then(/^I should see '([^\"]*)'$/) do |step|
  expect(step_eighteen_page.step_num.text).to eq step
end

Then(/^I should see check your details are correct copy$/) do
  expect(step_eighteen_page.copy[0].text).to have_content 'Please check your details are correct.'
end

Then(/^I should see my details:$/) do |scopes|
  scopes.rows.each_with_index do |scope, index|
    your_details = step_eighteen_page.tbody.tr[index]
    expect(your_details.th.text).to eq scope[0]
    expect(your_details).to have_td
  end
end

Then(/^I should be able to go back and change my details:$/) do |urls|
  urls.rows.each_with_index do |url, index|
    your_details = step_eighteen_page.tbody.tr[index]
    expect(your_details.right_link['href']).to have_content url[0]
    expect(your_details.right_link.text).to have_content 'Change'
  end
end

Then(/^I should see declaration of truth$/) do
  expect(step_eighteen_page.h2[0].text).to eq 'Declaration and statement of truth'
  expect(step_eighteen_page.copy[1].text).to have_content 'is true to the best of my knowledge'
end

When(/^I click submit application and continue$/) do
  step_eighteen_page.submit_button.click
end

Then(/^I taken to step 19 of 20 confirmation$/) do
  expect(current_path).to eq '/confirmation'
end
