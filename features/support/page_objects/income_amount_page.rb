class IncomeAmountPage < BasePage
  set_url '/questions/income_amount'

  section :content, '#content' do
    element :step_info, '.step-info', text: 'Step 10 of 20'
    element :income_amount_single_header, 'h1', text: 'What was your total monthly income?'
    element :income_amount_married_header, 'h1', text: 'What was your total monthly income?'
    element :hint_text_single, '.text', text: 'Enter the total monthly amount you received in income from:'
    element :hint_text_married, '.text', text: 'Enter the total monthly amount you and your partner received in income from:'
    section :text, '.text' do
      elements :li, 'li'
    end
    element :average_income_hint, '.text', text: 'If your income varied from month to month, work out an average monthly income based on the 3 months before you paid the fee.'
    element :income_amount, '#income_amount_amount'
    element :blank_error_link, 'a', text: 'Enter how much income do you receive'
    element :blank_error_message, '.error-message', text: 'Enter how much income do you receive'
  end

  def to_income_amount_single
    form_name_page.load_page
    form_name_page.submit_valid_form_number
    fee_page.submit_fee_yes
    marital_status_page.submit_single
    savings_investment_page.high_amount_checked
    benefit_page.submit_benefit_no
    dependent_page.submit_dependent_3
    income_kind_page.submit_married_income_wages_tax_credit
    income_range_page.submit_between
  end

  def to_income_amount_married
    form_name_page.load_page
    form_name_page.submit_valid_form_number
    fee_page.submit_fee_yes
    marital_status_page.submit_married
    savings_investment_page.high_amount_checked
    benefit_page.submit_benefit_no
    dependent_page.submit_dependent_3
    income_kind_page.submit_married_income_wages_tax_credit
    income_range_page.submit_between
  end
end
