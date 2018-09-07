class FormNamePage < BasePage
  set_url '/session/start'

  section :content, '#content' do
    element :step_info, '.step-info', text: 'Step 1 of 20'
    element :form_name_header, 'h1', text: 'What court or tribunal fee do you need help with?'
    element :form_label, '.form-label', text: 'Form name or number'
    element :form_name, '#form_name_identifier'
    element :enter_court_hint, '.text', text: 'Enter the court or tribunal form number for the court business you need help with, for example ‘C100’, ‘D8’ or ‘notice to appeal’ form.'
    element :error_link, '.error-link', text: "Enter the form name or number, or select 'I don’t know the form name or number'"
    element :error_message, '.error-message', text: "Enter the form name or number, or select 'I don’t know the form name or number'"
    element :please_note, '.text', text: 'Please note'
    element :timeout, '.text', text: 'If you don’t enter any information for more than 60 minutes,'
    element :form_name_unknown_label, '.block-label', text: 'I don’t know the form name or number'
    element :form_name_unknown, '#form_name_unknown'
    element :find_form_name, 'p', text: 'You can usually find the form name at the top of the form'
    element :no_form_name, 'p', text: 'If you don’t have a form name or number'
    element :continue_button, 'input[value="Continue"]'
  end
end

def submit_valid_form_number
  form_name_page.content.form_name.set('C100')
  continue
end

def submit_valid_form_name
  form_name_page.content.form_name.set('notice to appeal')
  continue
end

def continue
  form_name_page.content.continue_button.click
end