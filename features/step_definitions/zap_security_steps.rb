# rubocop:disable Metrics/BlockLength
When(/^I take the happy path through steps 1 to 20$/) do
  # step one
  group_one(0).form_name_identifier.set('C100')
  base_page.continue_button.click
  # step two
  group_two(0).fee_paid_false.click
  base_page.continue_button.click
  # step three
  group_three(0).marital_status_married_false.click
  base_page.continue_button.click
  # step four
  group_four(0).savings_and_investment_choice_between.click
  base_page.continue_button.click
  # step five
  group_five(0).over_61_true.click
  base_page.continue_button.click
  # step six
  group_six(0).benefits_false.click
  base_page.continue_button.click
  # step seven
  group_seven(0).dependent_children_false.click
  base_page.continue_button.click
  # step eight
  step_eight_page.content.form_group[0].block_label[2].click
  base_page.continue_button.click
  # step nine
  income_range_page.content.form_group[0].income_range_between.click
  base_page.continue_button.click
  # step ten
  income_amount_page.content.form_group[0].income_amount.set(1900)
  base_page.continue_button.click
  # step eleven
  step_eleven_page.probate_case_false.click
  base_page.continue_button.click
  # step twelve
  step_twelve_page.number_false.click
  base_page.continue_button.click
  # step thirteen
  step_thirteen_page.national_insurance_number.set('JL806367D')
  base_page.continue_button.click
  # step fourteen
  step_fourteen_page.dob_date_of_birth.set(Time.zone.today - 34.years)
  base_page.continue_button.click
  # step fifteen
  personal_details_page.first_name.set('Sally')
  personal_details_page.last_name.set('Smith')
  base_page.continue_button.click
  # step sixteen
  step_sixteen_page.address.set('102 Petty France, London')
  step_sixteen_page.postcode.set('SW1H 9AJ')
  # step seventeen
  base_page.continue_button.click
  base_page.continue_button.click
  # step eighteen
  summary_page.submit_button.click
  # step nineteen
  base_page.continue_button.click
  # step twenty
  confirmation_done_page.finish_application_button.click
end
# rubocop:enable Metrics/BlockLength
