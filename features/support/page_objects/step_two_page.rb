class StepTwoPage < BasePage
  set_url '/questions/fee'

  section :content, '#content' do
    element :apply_for_refund, '.text', text: 'You can apply for a refund for a fee paid in the last 3 months'
    sections :form_group, '.form-group' do
      element :no, '.block-label', text: 'No'
      element :fee_paid_false, '#fee_paid_false'
      element :yes, '.block-label', text: 'Yes'
      element :fee_paid_true, '#fee_paid_true'
      element :use_this_date, '.hint', text: 'Use this format D D / M M / Y Y Y Y'
      element :fee_date_paid, '#fee_date_paid'
      element :date_fee_paid, '.form-label', text: 'Date fee paid'
    end
  end
end
