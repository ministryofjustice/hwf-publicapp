Given(/^I visit the page for step eighteen$/) do
  step 'I am on the page for step one'
  step 'I submit the form with a valid form number'
  step 'I select no to have you already paid the fee?'
  step 'I click continue'
  step 'I submit the form as single'
  step 'I submit the form with £0 to £2,999 checked'
  step 'I submit the form with no I do not receive one of the benefits listed'
  step 'I select no to do you have any children'
  step 'after selecting working tax credit from income list on step eight'
  step 'I click continue'
  step 'I select between'
  step 'I enter a valid total monthly income'
  step 'I select no to are you paying a fee for a probate case'
  step 'I select no to do you have a case, claim or notice to pay number'
  step 'I enter a valid national insurance number'
  step 'I enter a valid date of birth'
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
