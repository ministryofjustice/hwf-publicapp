class StepSixteenPage < BasePage
  element :address, '#applicant_address_address'
  element :postcode, '#applicant_address_postcode'
  elements :form_group, '.form-group'

  def load_page(page_version = nil)
    load(v: page_version)
  end
end
