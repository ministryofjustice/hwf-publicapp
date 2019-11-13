class IncomeRangePage < BasePage
  set_url '/questions/income_range'

  section :content, '#content' do
    element :step_info, '.govuk-caption-l', text: 'Step 9 of 20'
    element :income_range_header_single, 'h1', text: 'How much income did you receive each month?'
    element :income_range_header_married, 'h1', text: 'How much income do you and your partner receive each month?'
    element :select_single_income_hint, '.text', text: 'Select the monthly amount you received in income from:'
    element :select_married_income_hint, '.text', text: 'Select the monthly amount you and your partner receive in income from: Wages If your income varies from month to month, work out an average monthly income based on the last 3 months.'
    element :choose_income_single, '.text', text: 'Choose the different types of income you receive.'
    element :choose_income_married, '.text', text: 'Choose the different types of income you and your partner receive.'
    elements :income_label, '.block-label'
    elements :input, '.block-label input'
    elements :income, 'li'
    element :blank_error_link, 'a', text: 'Select your monthly income'
    element :blank_error_message, '.error-message', text: 'Select your monthly income'
    element :income_range_less, '#income_range_choice_less'
    element :income_range_between, '#income_range_choice_between'
    element :income_range_more, '#income_range_choice_more'
  end

  def to_income_range_page_single
    form_name_page.to_form_name
    form_name_page.submit_valid_form_number
    fee_page.submit_fee_yes
    marital_status_page.submit_single
    savings_investment_page.high_amount_checked
    benefit_page.submit_benefit_no
    dependent_page.submit_dependent_no
    income_kind_page.submit_single_income_wages_tax_credit
  end

  def to_income_range_page_married
    form_name_page.to_form_name
    form_name_page.submit_valid_form_number
    fee_page.submit_fee_yes
    marital_status_page.submit_married
    savings_investment_page.high_amount_checked
    benefit_page.submit_benefit_no
    dependent_page.submit_dependent_no
    income_kind_page.submit_married_income_wages_tax_credit
  end

  def to_income_range_page_single_dependent_3
    form_name_page.to_form_name
    form_name_page.submit_valid_form_number
    fee_page.submit_fee_yes
    marital_status_page.submit_single
    savings_investment_page.high_amount_checked
    benefit_page.submit_benefit_no
    dependent_page.submit_dependent_3
    income_kind_page.submit_single_income_wages_tax_credit
  end

  def to_income_range_page_married_dependent_3
    form_name_page.to_form_name
    form_name_page.submit_valid_form_number
    fee_page.submit_fee_yes
    marital_status_page.submit_married
    savings_investment_page.high_amount_checked
    benefit_page.submit_benefit_no
    dependent_page.submit_dependent_3
    income_kind_page.submit_married_income_wages_tax_credit
  end

  def submit_less
    content.income_range_less.click
    continue
  end

  def submit_between
    content.income_range_between.click
    continue
  end

  def submit_more
    content.income_range_more.click
    continue
  end
end
