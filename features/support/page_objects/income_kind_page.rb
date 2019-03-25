class IncomeKindPage < BasePage
  set_url '/questions/income_kind'

  section :content, '#content' do
    element :step_info, '.step-info', text: 'Step 8 of 20'
    element :income_kind_header_single, 'h1', text: 'What kind of income do you receive?'
    element :income_kind_header_married, 'h1', text: 'What kind of income do you and your partner receive?'
    element :choose_income_single, '.text', text: 'Choose the different types of income you receive.'
    element :choose_income_married, '.text', text: 'Choose the different types of income you and your partner receive.'
    element :your_income, 'h3', text: 'Your income'
    element :partners_income, 'h3', text: 'Your partner\'s income'
    element :wages, '.block-label', text: 'Wages'
    element :no_income, '.block-label', text: 'No income'
    elements :income_label, '.block-label'
    elements :input, '.block-label input'
    element :blank_error_link, 'a', text: 'Select your kinds of income'
    element :blank_error_message, '.error-message', text: 'Select your kinds of income'
  end
end
