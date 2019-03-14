class FormNamePage < BasePage
  set_url '/session/start'

  section :content, '#content' do
    element :step_info, '.step-info', text: 'Step 1 of 20'
    element :form_name_header, 'h1', text: 'What number is on your court or tribunal form?'
    element :form_label, '.form-label', text: 'Form number'
    element :form_name, '#form_name_identifier'
    element :enter_court_hint, '.text', text: "You'll find a number at the bottom of paper forms, for example C100 or ADM1A."
    element :error_link, 'a', text: "Enter a valid form number or select 'I don't have a form'"
    element :error_message, '.error-message', text: "Enter a valid form number or select 'I don't have a form'"
    element :please_note, '.text', text: 'Please note'
    element :timeout, '.text', text: 'If you don’t enter any information for more than 60 minutes,'
    element :form_name_unknown_label, '.block-label', text: 'I don’t have a form'
    element :form_name_unknown, '#form_name_unknown'
    element :find_form_name, 'p', text: "Instead of a form number enter 'hearing fee' followed by short explanation, for example 'hearing fee for small claims' or 'hearing fee for fast track'."
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
