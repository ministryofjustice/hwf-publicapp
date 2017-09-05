def common_step_header
  expect(common_page.content).to have_h1
  expect(common_page.content).to have_p
end

Given(/^I have started my application$/) do
  step_one_page.load_page
end

Then(/^I should see the content for step one$/) do
  common_step_header
  expect(step_one_page.content).to have_hint
  expect(group_one(0)).to have_label
  expect(group_one(1)).to have_block_label
  expect(group_one(2)).to have_block_label
  expect(group_common(3)).to have_help_with
  group_one(0).form_name_identifier.set('C100')
  common_page.continue_button.click
end

And(/^I should see the content for step two$/) do
  common_step_header
  expect(step_two_page.content.text).to have_p
  expect(step_two_page.content.block_label.count).to eq 2
  group_two(0).fee_paid_false.click
  common_page.continue_button.click
end

And(/^I should see the content for step three$/) do
  common_step_header
  expect(group_three(0).block_label.count).to eq 2
  expect(group_common(1)).to have_help_with
  group_three(0).marital_status_married_false.click
  common_page.continue_button.click
end

And(/^I should see the content for step four$/) do
  common_step_header
  expect(group_four(0).block_label.count).to eq 3
  expect(group_common(1)).to have_help_with
  group_four(0).savings_and_investment_choice_between.click
  common_page.continue_button.click
end

And(/^I should see the content for step five$/) do
  common_step_header
  expect(group_three(0).block_label.count).to eq 2
  group_five(0).over_61_true.click
  common_page.continue_button.click
end

And(/^I should see the content for step six$/) do
  common_step_header
  expect(group_six(1).details_content.ul[0].li.count).to eq 6
  expect(group_six(1).details_content.ul[0].hint.count).to eq 4
  expect(group_six(0).block_label.count).to eq 2
  expect(group_common(1)).to have_help_with
  group_six(0).benefits_false.click
  common_page.continue_button.click
end

And(/^I should see the content for step seven$/) do
  common_step_header
  expect(group_seven(0).block_label.count).to eq 2
  expect(group_common(2)).to have_help_with
  group_seven(0).dependent_children_false.click
  common_page.continue_button.click
end

And(/^I should see the content for step eight$/) do
  common_step_header
  expect(common_page.content.text).to have_p
  expect(saucelabs_page.income_sources.block_label.count).to eq 13
  group_eight(0).block_label[0].click
  common_page.continue_button.click
end

And(/^I should see the content for step nine$/) do
  common_step_header
  expect(common_page.content).to have_text
  expect(step_nine_page.content.form_group[0].block_label.count).to eq 3
  step_nine_page.content.form_group[0].income_range_between.click
  common_page.continue_button.click
end

And(/^I should see the content for step ten$/) do
  common_step_header
  expect(common_page.content).to have_text
  step_ten_page.content.form_group[0].income_amount.set(1900)
  common_page.continue_button.click
end

And(/^I should see the content for step eleven$/) do
  common_step_header
  expect(common_page.content.text).to have_p
  expect(step_eleven_page.block_label.count).to eq 2
  step_eleven_page.probate_case_false.click
  common_page.continue_button.click
end

And(/^I should see the content for step twelve$/) do
  common_step_header
  expect(common_page.content.text).to have_p
  expect(step_twelve_page.block_label.count).to eq 2
  expect(group_common(2)).to have_help_with
  step_twelve_page.number_false.click
  common_page.continue_button.click
end

And(/^I should see the content for step thirteen$/) do
  common_step_header
  expect(common_page.content.text).to have_p
  expect(step_thirteen_page.form_group[1].details_content.li.count).to eq 2
  expect(step_thirteen_page.form_group[1].details_content.li[1]).to have_a
  expect(step_thirteen_page.form_group[1].details_content.p.count).to eq 1
  step_thirteen_page.national_insurance_number.set('JL806367D')
  common_page.continue_button.click
end

And(/^I should see the content for step fourteen$/) do
  common_step_header
  expect(step_fourteen_page).to have_hint
  step_fourteen_page.dob_date_of_birth.set(Time.zone.today - 34.years)
  common_page.continue_button.click
end

And(/^I should see the content for step fifteen$/) do
  common_step_header
  expect(step_fifteen_page.form_group.count).to eq 4
  step_fifteen_page.first_name.set('Sally')
  step_fifteen_page.last_name.set('Smith')
  common_page.continue_button.click
end

And(/^I should see the content for step sixteen$/) do
  common_step_header
  expect(step_sixteen_page.form_group.count).to eq 3
  step_sixteen_page.address.set('102 Petty France, London')
  step_sixteen_page.postcode.set('SW1H 9AJ')
  common_page.continue_button.click
end

And(/^I should see the content for step seventeen$/) do
  common_step_header
  expect(step_seventeen_page).to have_contact_email
  expect(step_seventeen_page).to have_hint
  common_page.continue_button.click
end

And(/^I should see the content for step eighteen$/) do
  common_step_header
  expect(common_page.content.text).to have_p
  expect(step_eighteen_page.tbody.tr.count).to eq 14
  expect(step_eighteen_page.h2[0].text).to eq 'Declaration and statement of truth'
  step_eighteen_page.submit_button.click
end

And(/^I should see the content for step nineteen$/) do
  expect(common_page).to have_heading_secondary
  expect(common_page.content).to have_h2
  expect(step_nineteen_page.steps_panel.li.count).to eq 4
  expect(step_nineteen_page.steps_panel).to have_hwf_ref
  common_page.button.click
end

And(/^I should see the content for step twenty$/) do
  expect(common_page).to have_heading_secondary
  expect(common_page.content).to have_h2
  expect(step_twenty_page.post).to have_p
  expect(step_twenty_page.steps_panel).to have_h2
  expect(step_twenty_page.steps_panel.li.count).to eq 3
  expect(common_page).to have_js_print
  common_page.button.click
end