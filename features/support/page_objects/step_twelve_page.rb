class StepTwelvePage < BasePage
  elements :block_label, '.block-label'
  element :number_false, '#claim_default_number_false'
  element :number_true, '#claim_default_number_true'
  elements :error_message, '.error-message'
  element :claim_default_identifier, '#claim_default_identifier'
  element :claim_et_identifier, '#claim_et_identifier'
  element :form_label, '.form-label'
  sections :form_group, '.form-group' do
    section :details_content, '#details-content-0' do
      elements :p, 'p'
    end
  end
end
