class StepSixteenPage < BasePage
  element :address, '#applicant_address_address'
  element :postcode, '#applicant_address_postcode'
  sections :form_group, '.form-group' do
    element :form_label, 'form-label'
    element :hint, '.hint'
  end

  def load_page(page_version = nil)
    load(v: page_version)
  end
end
