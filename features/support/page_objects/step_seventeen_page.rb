class StepSeventeenPage < BasePage
  element :contact_email, '#contact_email'
  elements :form_group, '.form-group'

  def load_page(page_version = nil)
    load(v: page_version)
  end
end
