class FormNamePage < BasePage
  set_url '/questions/form_name'

  section :content, '#content' do
    element :step_info, '.step-info', text: 'Step 1 of 20'
    element :form_name_header, 'h1', text: 'What number is on your court or tribunal form?'
    element :probate_warning_message, '#probate-warning', text: 'Help with Fees is no longer available for probate applications.'
    element :probate_link, 'a', text: 'Find further details and apply for probate.'
    element :form_label, '.govuk-label', text: 'Form number'
    element :form_name, '#form_name_identifier'
    element :enter_court_hint, '.text', text: 'You\'ll find a number at the bottom of paper forms, for example C100 or ADM1A.'
    element :error_link, 'a', text: "Enter a valid form number or select 'I don't have a form'"
    element :error_message, '.error-message', text: "Enter a valid form number or select 'I don't have a form'"
    element :invalid_link, 'a', text: 'You entered the help with fees form number. Enter the number on your court or tribunal form'
    element :invalid_message, '.error-message', text: 'You entered the help with fees form number. Enter the number on your court or tribunal form'
    element :form_name_unknown, '.block-label', text: 'I don’t have a form'
    element :find_form_name, 'p', text: 'You can usually find the form name at the top of the form'
    element :no_form, '.block-label', text: 'I don’t have a form'
    element :help_hearing_fees, 'p', text: "Instead of a form number enter 'hearing fee' followed by short explanation, for example 'hearing fee for small claims' or 'hearing fee for fast track'."
  end

  def submit_valid_form_number
    content.form_name.set('C100')
    continue
  end

  def submit_valid_form_name
    content.form_name.set('notice to appeal')
    continue
  end

  def to_form_name
    checklist_page.load_page
    checklist_page.continue
  end
end
