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
  expect(group_six(0)).to have_yes
  group_six(0).benefits_true.click
  common_page.continue_button.click
end

When(/^I submit the form with no I do not receive one of the benefits listed$/) do
  expect(group_six(0)).to have_no
  group_six(0).benefits_false.click
  common_page.continue_button.click
end

Then(/^I should see the instruction bullet points:$/) do |benefits|
  expect(step_six_page.content).to have_benefits_text
  benefits.rows.each_with_index do |benefit, index|
    expect(step_six_page.content.li[index].text).to eq benefit[0]
  end
end

Then(/^I should see the benefits table:$/) do |table|
  table.raw.each_with_index do |item, index|
    first = index * 2
    expect(step_six_page.content.td[first].text).to eq item[0]
    expect(step_six_page.content.td[first + 1].text).to eq item[1]
  end
end

Then(/^I should see help with benefits copy$/) do
  expect(group_six(1)).to have_help_with_benefits
  expect(group_six(1)).to have_recently_receiving_heading
  expect(group_six(1)).to have_provide_a_letter
  expect(group_six(1)).to have_similar_names_heading
  expect(group_six(1)).to have_benefits_with_similar_names
  expect(group_six(1)).to have_job_seekers
  expect(group_six(1)).to have_employment_support
  expect(group_six(1)).to have_pension_credit
  expect(group_six(1)).to have_universal_credit
  expect(group_six(1)).to have_laa_assistance
  expect(group_six(1)).to have_laa_representation
end
