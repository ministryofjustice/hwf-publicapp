Given(/^I go to step twenty without skipping step nineteen$/) do
  step 'I select no to have you already paid the fee?'
  step 'I select single'
  step 'I select £0 to £2,999'
  step 'I select no to do you receive any of the following benefits?'
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
  step 'I enter a valid email address'
  step 'I click submit application and continue'
  step 'I press the continue button'
end

Given(/^I go to step twenty by skipping step nineteen$/) do
  step 'I select no to have you already paid the fee?'
  step 'I select single'
  step 'I select £0 to £2,999'
  step 'I select no to do you receive any of the following benefits?'
  step 'I select no to do you have any children'
  step 'after selecting working tax credit from income list on step eight'
  step 'I click continue'
  step 'I select between'
  step 'I enter a valid total monthly income'
  step 'I enter a employment tribunal number'
  step 'I enter a valid national insurance number'
  step 'I enter a valid date of birth'
  step 'I enter my full name'
  step 'I enter my address with postcode'
  step 'I click submit application and continue'
  step 'I press the continue button'
end

When(/^I click the finish application button$/) do
  common_page.button.click
end

Then(/^I am taken to the thank you page$/) do
  expect(current_path).to eq '/'
end

Then(/^I should see deliver your paperwork copy$/) do
  expect(step_twenty_page.post.p.text).to have_content 'Deliver your paperwork to the court'
end

Then(/^I should see what happens next with (\d+) points$/) do |point|
  expect(step_twenty_page.steps_panel.h2.text).to eq 'What happens next?'
  expect(step_twenty_page.steps_panel.li.count.to_s).to eq point
end

Then(/^I should see point 1 with HWF number$/) do
  expect(step_twenty_page.li[0].text).to have_content 'reference number HWF-000-000'
end
