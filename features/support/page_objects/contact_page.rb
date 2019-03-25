class ContactPage < BasePage
  set_url '/questions/contact'

  element :contact_email, '#contact_email'
  section :form_checkbox, '.form-checkbox' do
    element :contact_feedback_opt_in, '#contact_feedback_opt_in'
    element :span, 'span'
  end
  elements :form_group, '.form-group'
  element :hint, '.hint'
end
