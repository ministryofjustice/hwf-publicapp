class IncomeRangePage < BasePage
  section :content, '#content' do
    element :step_info, '.step-info', text: 'Step 9 of 20'
    element :income_range_header_single, 'h1', text: 'How much income do you receive each month?'
    element :income_range_header_married, 'h1', text: 'How much income do you and your partner receive each month?'
    element :select_single_income_hint, '.text', text: 'Select the monthly amount you receive in income from:'
    element :select_married_income_hint, '.text', text: 'Select the monthly amount you and your partner receive in income from: Wages If your income varies from month to month, work out an average monthly income based on the last 3 months.'
    element :choose_income_single, '.text', text: 'Choose the different types of income you receive.'
    element :choose_income_married, '.text', text: 'Choose the different types of income you and your partner receive.'
    element :your_income, 'h3', text: 'Your income'
    element :partners_income, 'h3', text: 'Your partner\'s income'
    element :wages, 'li', text: 'Wages'
    element :no_income, 'li', text: 'No income'
    elements :income_label, '.block-label'
    elements :input, '.block-label input'
    elements :li, 'li'
    element :blank_error_link, 'a', text: 'Select your monthly income'
    element :blank_error_message, '.error-message', text: 'Select your monthly income'
    element :income_range_less, '#income_range_choice_less'
    element :income_range_between, '#income_range_choice_between'
    element :income_range_more, '#income_range_choice_more'
  end
end
