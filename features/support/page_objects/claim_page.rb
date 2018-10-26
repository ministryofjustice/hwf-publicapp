class ClaimPage < BasePage
  section :content, '#content' do
    element :step_info, '.step-info', text: 'Step 12 of 20'
    element :claim_header, 'h1', text: 'Do you have a case, claim or ‘notice to pay’ number?'
    element :claim_text, '.text', text: 'Find this number on letters from the court or tribunal.'
    element :no, '.block-label', text: 'No'
    element :yes, '.block-label', text: 'Yes'
    element :claim_input_field, '#claim_default_identifier'
    element :claim_number_label, '.form-label', text: 'The case, claim or ‘notice to pay’ number is'
    element :creates_reference_number_copy, '.text', text: 'The court or tribunal creates a reference number for every case. This is sometimes called a claim number, case number, or ‘notice to pay’ number.'
    element :ongoing_case_copy, '.text', text: 'If your case is ongoing then you’ll find the reference number on letters from the court or tribunal.'
    element :dont_have_reference_number_copy, '.text', text: "Answer 'no' to this question if you don’t have a reference number (this might be because your case hasn’t started yet)."
    element :blank_error_link, 'a', text: 'Select whether you have a case, claim or ‘notice to pay’ number'
    element :blank_error_message, '.error-message', text: 'Select whether you have a case, claim or ‘notice to pay’ number'
    element :enter_number_error_link, 'a', text: 'Enter a case, claim or ‘notice to pay’ number'
    element :enter_number_error_message, '.error-message', text: 'Enter a case, claim or ‘notice to pay’ number'
  end
end