class IncomeAmountPage < BasePage
  set_url '/questions/income_amount'
  
  section :content, '#content' do
    element :step_info, '.step-info', text: 'Step 10 of 20'
    element :income_amount_single_header, 'h1', text: 'What’s your total monthly income?'
    element :income_amount_married_header, 'h1', text: 'What’s your total monthly income?'
    element :hint_text_single, '.text', text: 'Enter the total monthly amount you receive in income from:'
    element :hint_text_married, '.text', text: 'Enter the total monthly amount you and your partner receive in income from:'
    section :text, '.text' do
      elements :li, 'li'
    end
    element :average_income_hint, '.text', text: 'If your income varies from month to month, work out an average monthly income based on the last 3 months.'
    element :income_amount, '#income_amount_amount'
    element :blank_error_link, 'a', text: 'Enter how much income do you receive'
    element :blank_error_message, '.error-message', text: 'Enter how much income do you receive'
  end
end
