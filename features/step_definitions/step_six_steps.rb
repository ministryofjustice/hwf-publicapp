def group_six(index)
  step_six_page.content.form_group[index]
end

Given(/^I am on the page for step six$/) do
  step 'I am on the page for step one'
  step 'I submit the form with a valid form number'
  step 'I select no to have you already paid the fee?'
  step 'I click continue'
  step 'I submit the form as single'
  step 'I submit the form with £0 to £2,999 checked'
end

When(/^I submit the form with yes I am receiving one of the benefits listed$/) do
  expect(group_six(0).block_label[1].text).to eq 'Yes, I am receiving one of the benefits listed'
  group_six(0).benefits_true.click
  common_page.continue_button.click
end

When(/^I submit the form with no I do not receive one of the benefits listed$/) do
  expect(group_six(0).block_label[0].text).to eq 'No'
  group_six(0).benefits_false.click
  common_page.continue_button.click
end

Then(/^I should see the benefits list:$/) do |benefits|
  benefit_group = step_six_page.content.text[0]
  expect(benefit_group.p[0].text).to have_content 'contact the Department for Work and Pensions'
  benefits.rows.each_with_index do |benefit, index|
    expect(benefit_group.li[index].text).to eq benefit[0]
  end
end

Then(/^I should see help with benefits copy$/) do
  first_heading = group_six(1).details_content.heading_small[0].text
  second_heading = group_six(1).details_content.heading_small[1].text

  expect(first_heading).to have_content 'recently started receiving one of these benefits'
  expect(second_heading).to have_content 'Benefits with similar names'
  expect(group_six(1).details_content.ul[0].li.count).to eq 6
  expect(group_six(1).details_content.ul[0].hint.count).to eq 4
end
