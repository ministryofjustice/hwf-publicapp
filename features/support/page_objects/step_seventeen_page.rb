class StepSeventeenPage < BasePage
  element :contact_email, '#contact_email'
  section :form_checkbox, '.form-checkbox' do
    element :contact_feedback_opt_in, '#contact_feedback_opt_in'
    element :span, 'span'
  end
  elements :form_group, '.form-group'

  def load_page(page_version = nil)
    load(v: page_version)
  end
end
