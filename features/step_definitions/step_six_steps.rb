Given(/^I visit the page for step six$/) do
  step 'I visit the page for step one'
  step 'I enter a valid form number'
  step 'I select no to have you already paid the fee?'
  step 'I select single'
  step 'I select £0 to £2,999'
end

When(/^I select yes to do you receive any of the following benefits\?$/) do
  yes_no_group = step_six_page.content.form_group[0]
  expect(yes_no_group.block_label[1].text).to eq 'Yes, I am receiving one of the benefits listed'
  yes_no_group.benefits_true.click
  step_six_page.content.form_group[2].continue_button.click
end

When(/^I select no to do you receive any of the following benefits\?$/) do
  yes_no_group = step_six_page.content.form_group[0]
  expect(yes_no_group.block_label[0].text).to eq 'No'
  yes_no_group.benefits_false.click
  step_six_page.content.form_group[2].continue_button.click
end

Then(/^I should see the benefits list$/) do
  benefits = step_six_page.content.text[0]
  expect(benefits.p[0].text).to have_content 'contact the Department for Work and Pensions'
  expect(benefits.li.count).to eq 6
  expect(benefits.hint.count).to eq 5
end

Then(/^I should see help with benefits copy$/) do
  help_with_status_group = step_six_page.content.form_group[1].details_content
  first_heading = help_with_status_group.heading_small[0].text
  second_heading = help_with_status_group.heading_small[1].text

  expect(first_heading).to have_content 'recently started receiving one of these benefits'
  expect(second_heading).to have_content 'Benefits with similar names'
  expect(help_with_status_group.ul[0].li.count).to eq 6
  expect(help_with_status_group.ul[0].hint.count).to eq 4
end