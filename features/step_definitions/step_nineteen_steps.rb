Given(/^I visit the page for step nineteen$/) do
  step 'I am on the page for step one'
  step 'I submit the form with a valid form number'
  step 'I select no to have you already paid the fee?'
  step 'I click continue'
  step 'I submit the form as single'
  step 'I submit the form with £0 to £2,999 checked'
  step 'I submit the form with no I do not receive one of the benefits listed'
  step 'I submit the form with no I do not have any children'
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
  step 'I enter a valid email address'
  step 'I click submit application and continue'
end

Then(/^I should see direction points 1 to 4$/) do
  expect(step_nineteen_page.steps_panel.li.count).to eq 4
  expect(step_nineteen_page.steps_panel.hwf_ref.text).to have_content 'HWF-000-000'
end

Then(/^I go to step twenty$/) do
  expect(current_path).to eq '/confirmation/done'
end
