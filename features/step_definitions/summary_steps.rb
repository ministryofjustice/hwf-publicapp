Given(/^I am on the summary page$/) do
  answer_up_to_income_amount_married
  step 'I submit the form with my monthly income'
  step 'I select no to are you paying a fee for a probate case'
  step 'I select no to do you have a case, claim or notice to pay number'
  step 'I enter a valid national insurance number'
  step 'I enter a valid date of birth'
  step 'I enter my full name'
  step 'I enter my address with postcode'
  step 'I click continue'
end

Then(/^I should see '([^\"]*)'$/) do |step|
  expect(summary_page.step_num.text).to eq step
end

Then(/^I should see check your details are correct copy$/) do
  expect(summary_page.copy[0].text).to have_content 'Please check your details are correct.'
end

Then(/^I should see my details:$/) do |scopes|
  scopes.rows.each_with_index do |scope, index|
    your_details = summary_page.tbody.tr[index]
    expect(your_details.th.text).to eq scope[0]
    expect(your_details).to have_td
  end
end

Then(/^I should be able to go back and change my details:$/) do |urls|
  urls.rows.each_with_index do |url, index|
    your_details = summary_page.tbody.tr[index]
    expect(your_details.right_link['href']).to have_content url[0]
    expect(your_details.right_link.text).to have_content 'Change'
  end
end

Then(/^I should see declaration of truth$/) do
  expect(summary_page.h2[0].text).to eq 'Declaration and statement of truth'
  expect(summary_page.copy[1].text).to have_content 'is true to the best of my knowledge'
end

When(/^I click submit application and continue$/) do
  summary_page.submit_button.click
end

Then(/^I should be taken to summary page$/) do
  expect(summary_page).to be_displayed
end