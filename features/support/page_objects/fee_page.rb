class FeePage < BasePage
  set_url '/questions/fee'

  section :content, '#content' do
    element :step_info, '.step-info', text: 'Step 2 of 20'
    element :fee_header, 'h1', text: 'Have you already paid the fee?'
    element :apply_for_refund, '.text', text: 'You can apply for a refund for a fee paid in the last 3 months'
    element :format_error_link, 'a', text: 'Enter the date in this format DD/MM/YYYY'
    element :format_error_message, '.error-message', text: 'Enter the date in this format DD/MM/YYYY'
    element :expired_error_link, 'a', text: 'The application must have been made in the last 3 months'
    element :expired_error_message, '.error-message', text: 'The application must have been made in the last 3 months'
    element :future_date_error_link, 'a', text: 'This date can\'t be in the future'
    element :future_date_error_message, '.error-message', text: 'This date can\'t be in the future'
    element :blank_error_link, 'a', text: 'Select whether you\'ve already paid the fee'
    element :blank_error_message, '.error-message', text: 'Select whether you\'ve already paid the fee'
    element :no, '.block-label', text: 'No'
    element :yes, '.block-label', text: 'Yes'
    element :use_this_date, '.hint', text: 'Use this format D D / M M / Y Y Y Y'
    element :fee_date_paid, '#fee_date_paid'
    element :date_fee_paid, '.form-label', text: 'Date fee paid'
  end

  def expired_date
    fee_page.content.fee_date_paid.set(Time.zone.today - 4.months)
    continue
  end

  def future_date
    fee_page.content.fee_date_paid.set(Time.zone.today + 1.month)
    continue
  end

  def valid_date
    fee_page.content.fee_date_paid.set(Time.zone.today - 1.month)
    continue
  end




end
