class IncomeAmountPage < BasePage
  set_url '/questions/income_amount'

  section :content, '#content' do
    element :step_info, '.govuk-caption-l', text: 'Step 10 of 20'
    element :income_amount_single_header, 'h1', text: 'What was your total monthly income?'
    element :income_amount_married_header, 'h1', text: 'What was your total monthly income?'
    element :hint_text_single, 'p', text: 'Enter the total monthly amount you received in income from:'
    element :hint_text_married, 'p', text: 'Enter the total monthly amount you and your partner received in income from:'
    section :income_list, '.govuk-list' do
      elements :li, 'li'
    end
    element :average_income_hint, 'p', text: 'If your income varied from month to month, work out an average monthly income based on the 3 months before you paid the fee.'
    element :income_amount, '#income_amount_amount'
    element :blank_error_link, 'a', text: 'Enter how much income do you receive'
  end

  def to_income_amount_single
    income_range_page.to_income_range_page_single
    income_range_page.submit_between
  end

  def to_income_amount_married
    income_range_page.to_income_range_page_married
    income_range_page.submit_between
  end
end
