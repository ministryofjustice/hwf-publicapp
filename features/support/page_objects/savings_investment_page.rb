class SavingsInvestmentPage < BasePage
  set_url '/questions/savings_and_investment'

  section :content, '#content' do
    element :step_info, '.step-info', text: 'Step 4 of 20'
    element :fee_header, 'h1', text: 'How much do you have in savings and investments?'
    element :married_reminder, '.text', text: 'Remember to include your partner’s savings and investments in your total.'
    element :low_amount, '.block-label', text: '£0 to £2,999'
    element :medium_amount, '.block-label', text: '£3,000 to £15,999'
    element :high_amount, '.block-label', text: '£16,000 or more'
    element :help_text, '.text', text: 'What to include in savings and investments: money in ISAs and any other savings account'
  end

  def to_married_savings
    form_name_page.load_page
    form_name_page.submit_valid_form_number
    fee_page.submit_fee_yes
    marital_status_page.submit_married
  end

  def to_single_savings
    form_name_page.load_page
    form_name_page.submit_valid_form_number
    fee_page.submit_fee_yes
    marital_status_page.submit_single
  end

  def low_amount_checked
    savings_investment_page.content.low_amount.click
    continue
  end

  def medium_amount_checked
    savings_investment_page.content.medium_amount.click
    continue
  end

  def high_amount_checked
    savings_investment_page.content.high_amount.click
    continue
  end
end
