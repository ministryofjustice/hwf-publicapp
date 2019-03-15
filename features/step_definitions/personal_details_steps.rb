Given(/^I visit the personal details page$/) do
  answer_up_to_income_amount_married
  step 'I submit the form with my monthly income'
  step 'I select no to are you paying a fee for a probate case'
  step 'I select no to do you have a case, claim or notice to pay number'
  step 'I enter a valid national insurance number'
  step 'I enter a valid date of birth'
end

When(/^I enter my title$/) do
  expect(personal_details_page.form_group[0].text).to have_content 'Title'
  expect(personal_details_page.hint.text).to eq '(Optional)'
  personal_details_page.title.set('Ms')
end

When(/^I enter my first name$/) do
  expect(personal_details_page.form_group[1].text).to eq 'First name'
  personal_details_page.first_name.set('Sally')
end

When(/^I enter my last name$/) do
  expect(personal_details_page.form_group[2].text).to eq 'Last name'
  personal_details_page.last_name.set('Smith')
  common_page.continue_button.click
end

When(/^I enter my full name$/) do
  expect(personal_details_page.form_group[1].text).to eq 'First name'
  personal_details_page.first_name.set('Sally')
  expect(personal_details_page.form_group[2].text).to eq 'Last name'
  personal_details_page.last_name.set('Smith')
  common_page.continue_button.click
end
