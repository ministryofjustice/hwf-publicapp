class StepThirteenPage < BasePage
  elements :block_label, '.block-label'
  element :national_insurance_number, '#national_insurance_number'
  element :form_label, '.form-label'
  sections :form_group, '.form-group' do
    section :details_content, '#details-content-0' do
      sections :li, 'li' do
        element :a, 'a'
      end
      elements :p, 'p'
    end
  end
end
