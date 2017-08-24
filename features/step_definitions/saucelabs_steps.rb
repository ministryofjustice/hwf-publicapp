Given(/^I submit my application successfully$/) do
  # step one - What court or tribunal fee do you need help with?
  step_one_page.load_page
  expect(common_page.content).to have_p
  expect(common_page.content).to have_h1
  expect(step_one_page.content).to have_hint
  expect(group_one(0)).to have_label
  expect(group_one(1)).to have_block_label
  expect(group_one(2)).to have_block_label
  expect(group_common(3)).to have_help_with
  group_one(0).form_name_identifier.set('C100')
  common_page.continue_button.click
  # step two - Have you already paid the fee?
  expect(common_page.content).to have_p
  expect(common_page.content).to have_h1
  expect(step_two_page.content.text).to have_p
  expect(step_two_page.content.block_label.count).to eq 2
  group_two(0).fee_paid_false.click
  common_page.continue_button.clic
  # step three - Are you single, married or living with someone and sharing an income?
  expect(common_page.content).to have_p
  expect(common_page.content).to have_h1
  expect(group_three(0).block_label.count).to eq 2
  expect(group_common(1)).to have_help_with
  group_three(0).marital_status_married_false.click
  common_page.continue_button.click
  # step four - How much do you have in savings and investments?
  expect(common_page.content).to have_p
  expect(common_page.content).to have_h1
  expect(group_four(0).block_label.count).to eq 3
  expect(group_common(1)).to have_help_with
  group_four(0).savings_and_investment_choice_between.click
  common_page.continue_button.click
  # step five - Are you 61 years old or over?
  expect(common_page.content).to have_p
  expect(common_page.content).to have_h1
  expect(group_three(0).block_label.count).to eq 2
  group_five(0).over_61_true.click
  common_page.continue_button.click
  # step six - Do you receive any of the following benefits?
  expect(common_page.content).to have_p
  expect(common_page.content).to have_h1
  expect(group_six(1).details_content.ul[0].li.count).to eq 6
  expect(group_six(1).details_content.ul[0].hint.count).to eq 4
  expect(group_six(0).block_label.count).to eq 2
  expect(group_common(1)).to have_help_with
  group_six(0).benefits_false.click
  common_page.continue_button.click
  # step seven - Do you have any children living with you, or who you support financially?
  expect(common_page.content).to have_p
  expect(common_page.content).to have_h1
  expect(group_seven(0).block_label.count).to eq 2
  expect(group_common(2)).to have_help_with
  group_seven(0).dependent_children_false.click
  common_page.continue_button.click
  # step eight - What kind of income do you receive?
  expect(common_page.content).to have_p
  expect(common_page.content).to have_h1
  expect(common_page.content.text).to have_p
  expect(saucelabs_page.income_sources.block_label.count).to eq 13
  group_eight(0).block_label[0].click
  common_page.continue_button.click
  # step nine - How much income do you receive each month?
  expect(common_page.content).to have_p
  expect(common_page.content).to have_h1
  expect(common_page.content).to have_text
  expect(step_nine_page.content.form_group[0].block_label.count).to eq 3
  step_nine_page.content.form_group[0].income_range_between.click
  common_page.continue_button.click
  # step ten - Whats your total monthly income?
  expect(common_page.content).to have_p
  expect(common_page.content).to have_h1
  expect(common_page.content).to have_text
  step_ten_page.content.form_group[0].income_amount.set(1900)
  common_page.continue_button.click
  # step eleven - Are you paying a fee for a probate case?
  expect(common_page.content).to have_p
  expect(common_page.content).to have_h1
  expect(common_page.content.text).to have_p
  expect(step_eleven_page.block_label.count).to eq 2
  step_eleven_page.probate_case_false.click
  common_page.continue_button.click
  # step twelve - Do you have a case, claim or notice to pay number?
  expect(common_page.content).to have_p
  expect(common_page.content).to have_h1
  expect(common_page.content.text).to have_p
  expect(step_twelve_page.block_label.count).to eq 2
  expect(group_common(2)).to have_help_with
  step_twelve_page.number_false.click
  common_page.continue_button.click
  # step thirteen - What is your National Insurance number?
  expect(common_page.content).to have_p
  expect(common_page.content).to have_h1
  expect(common_page.content.text).to have_p
  expect(step_thirteen_page.form_group[1].details_content.li.count).to eq 2
  expect(step_thirteen_page.form_group[1].details_content.li[1]).to have_a
  expect(step_thirteen_page.form_group[1].details_content.p.count).to eq 1
  step_thirteen_page.national_insurance_number.set('JL806367D')
  common_page.continue_button.click
  # step fourteen - What is your date of birth?
  expect(common_page.content).to have_p
  expect(common_page.content).to have_h1
  expect(step_fourteen_page).to have_hint
  step_fourteen_page.dob_date_of_birth.set(Time.zone.today - 34.years)
  common_page.continue_button.click
  # step fifteen - What is your full name?
  expect(common_page.content).to have_p
  expect(common_page.content).to have_h1
  expect(step_fifteen_page.form_group.count).to eq 4
  step_fifteen_page.first_name.set('Sally')
  step_fifteen_page.last_name.set('Smith')
  common_page.continue_button.click
  # step sixteen - What is your address?
  expect(common_page.content).to have_p
  expect(common_page.content).to have_h1
  expect(step_sixteen_page.form_group.count).to eq 3
  step_sixteen_page.address.set('102 Petty France, London')
  step_sixteen_page.postcode.set('SW1H 9AJ')
  common_page.continue_button.click
  # step seventeen - Whats your email address?
  expect(common_page.content).to have_p
  expect(common_page.content).to have_h1
  expect(step_seventeen_page).to have_contact_email
  expect(step_seventeen_page).to have_hint
  common_page.continue_button.click
  # step eighteen - Check details
  expect(common_page.content).to have_p
  expect(common_page.content).to have_h1
  expect(common_page.content.text).to have_p
  expect(step_eighteen_page.tbody.tr.count).to eq 14
  expect(step_eighteen_page.h2[0].text).to eq 'Declaration and statement of truth'
  step_eighteen_page.submit_button.click
  # step nineteen - Your application for help with fees is not finished yet
  expect(common_page).to have_heading_secondary
  expect(common_page.content).to have_h2
  expect(step_nineteen_page.steps_panel.li.count).to eq 4
  expect(step_nineteen_page.steps_panel).to have_hwf_ref
  common_page.button.click
  # step twenty - Send your claim form with your HWF-69D-4YW reference on it to complete the process
  expect(common_page).to have_heading_secondary
  expect(common_page.content).to have_h2
  expect(step_twenty_page.post).to have_p
  expect(step_twenty_page.steps_panel).to have_h2
  expect(step_twenty_page.steps_panel.li.count).to eq 3
  expect(common_page).to have_js_print
  common_page.button.click
end
