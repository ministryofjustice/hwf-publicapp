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
  step 'I click continue'
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

And(/^I should see point 2 with letter$/) do
  expect(step_twenty_page.li[1].text).to have_content 'You can copy the letter below'
  expect(step_twenty_page.li[1].inset.li.count).to eq 5
  expect(step_twenty_page.li[1].inset.li[0].text).to eq 'Reference: HWF-000-000'
  expect(step_twenty_page.li[1].inset.li[2].text).to eq 'My employment tribunal claim number is: 012345678.'
end

And(/^I should see point 3 with addresses$/) do
  en_cy = step_twenty_page.column_half[0]
  scotland = step_twenty_page.column_half[1]

  expect(step_twenty_page.list[0].li[7].text).to have_content 'Email or send your letter'

  expect(en_cy.heading_small.text).to eq 'England & Wales'
  expect(en_cy.ul.email.li[0].text).to eq 'ETHelpwithfees@hmcts.gsi.gov.uk'
  expect(en_cy.ul.email.li[1].text).to eq '(click for preformatted email)'
  expect(en_cy.ul.postal_address.text).to have_content 'Post your letter to:'
  expect(en_cy.ul.postal_address.li.count).to eq 4

  expect(scotland.heading_small.text).to eq 'Scotland'
  expect(scotland.ul.email.li[0].text).to eq 'GLASGOWET@hmcts.gsi.gov.uk'
  expect(scotland.ul.email.li[1].text).to eq '(click for preformatted email)'
  expect(scotland.ul.postal_address.text).to have_content 'Post your letter to:'
  expect(scotland.ul.postal_address.li.count).to eq 5
end
