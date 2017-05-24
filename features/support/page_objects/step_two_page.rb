class StepTwoPage < BasePage
  set_url '/questions/fee'

  section :content, '#content' do
    element :p, 'p'
    element :page_header, 'h1'
    sections :form_group, '.form-group' do
      element :form_label, '.form-label'
      element :hint, '.hint'
      element :fee_date_paid, '#fee_date_paid'
      element :fee_paid_false, '#fee_paid_false'
      element :fee_paid_true, '#fee_paid_true'
      element :continue_button, '.button'
      elements :visuallyhidden, '.visuallyhidden'
    end
    elements :block_label, '.block-label'
    section :text, '.text ' do
      element :p, 'p'
    end
  end

  def load_page(page_version = nil)
    load(v: page_version)
  end
end
