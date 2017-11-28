class StepOnePage < BasePage
  set_url 'session/start'
  section :content, '#content' do
    sections :form_group, '.form-group' do
      element :form_name, '.form-label', text: 'Form name or number'
      element :form_name_identifier, '#form_name_identifier'
      element :form_name_unknown_label, '.block-label', text: 'I don’t know the form name or number'
      element :form_name_unknown, '#form_name_unknown'
      element :find_form_name, 'p', text: 'You can usually find the form name at the top of the form'
      element :no_form_name, 'p', text: 'If you don’t have a form name or number'
    end
  end
end
