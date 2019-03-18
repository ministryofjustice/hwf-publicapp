class SavingsAndInvestmentExtraPage < BasePage
  set_url '/questions/savings_and_investment_extra'

  section :content, '#content' do
    element :step_info, '.step-info', text: 'Step 5 of 20'
    element :single_header, 'h1', text: 'Are you 61 years old or over?'
    element :married_header, 'h1', text: 'Are you or your partner 61 years old or over?'
    element :yes, '.block-label', text: 'Yes'
    element :no, '.block-label', text: 'No'
    element :how_much_label_single, '.form-label', text: 'How much between £3,000 and £15,999 do you have in savings and investments?'
    element :how_much_label_married, '.form-label', text: 'How much between £3,000 and £15,999 do you and your partner have in savings and investments?'
    element :extra_amount, '#savings_and_investment_extra_amount'
    element :error_link, 'a', text: 'Enter an amount between £3,000 and £15,999, or go back to the previous question about your savings'
    element :error_message, '.error-message', text: 'Enter an amount between £3,000 and £15,999, or go back to the previous question about your savings'
    element :blank_error_link, 'a', text: 'Enter how much you have in savings and investments'
    element :blank_error_message, '.error-message', text: 'Enter how much you have in savings and investments'
  end
end
