Given(/^I launch owasp zap for a scan$/) do
  launch_owasp_zap
end

When(/^I take the happy path through steps 1 to 20$/) do
  step_one_page.load_page
  group_one(0).form_name_identifier.set('notice to appeal')
  common_page.continue_button.click
  group_two(0).fee_paid_false.click
  common_page.continue_button.click
  group_three(0).marital_status_married_false.click
  common_page.continue_button.click
  group_four(0).savings_and_investment_choice_less.click
  common_page.continue_button.click
  group_six(0).benefits_false.click
  common_page.continue_button.click
  group_seven(0).dependent_children_false.click
  common_page.continue_button.click
  step_eight_page.content.form_group[0].block_label[2].click
  common_page.continue_button.click
  step_nine_page.content.form_group[0].income_range_between.click
  common_page.continue_button.click
  step_ten_page.content.form_group[0].income_amount.set(1900)
  common_page.continue_button.click
  step_eleven_page.probate_case_false.click
  common_page.continue_button.click
  step_twelve_page.number_false.click
  common_page.continue_button.click
  step_thirteen_page.national_insurance_number.set('JL806367D')
  common_page.continue_button.click
  step_fourteen_page.dob_date_of_birth.set(Time.zone.today - 34.years)
  common_page.continue_button.click
  step_fifteen_page.first_name.set('Sally')
  step_fifteen_page.last_name.set('Smith')
  common_page.continue_button.click
  step_sixteen_page.address.set('102 Petty France, London')
  step_sixteen_page.postcode.set('SW1H 9AJ')
  common_page.continue_button.click
  common_page.continue_button.click
  step_eighteen_page.submit_button.click
  common_page.button.click
  common_page.button.click
  expect(current_path).to eq '/'
  sleep 20
end

Then(/^I should be able to see security warnings$/) do
  security_warnings
end
