class StepOnePage < BasePage
  set_url '/session/start'

  section :content, '#content' do
    element :enter_court_hint, '.text', text: 'Enter the court or tribunal form number for the court business you need help with, for example ‘C100’, ‘D8’ or ‘notice to appeal’ form.'
    element :please_note, '.text', text: 'Please note'
    element :timeout, '.text', text: 'If you don’t enter any information for more than 60 minutes,'
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
