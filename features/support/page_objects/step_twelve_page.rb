class StepTwelvePage < BasePage
  elements :block_label, '.block-label'
  element :number_false, '#claim_default_number_false'
  element :number_true, '#claim_default_number_true'
  elements :error_message, '.error-message'
  element :claim_default_identifier, '#claim_default_identifier'
  element :claim_et_identifier, '#claim_et_identifier'
  element :form_label, '.form-label'
  element :creates_reference_number_copy, '.text', text: 'The court or tribunal creates a reference number for every case. This is sometimes called a claim number, case number, or ‘notice to pay’ number.'
  element :ongoing_case_copy, '.text', text: 'If your case is ongoing then you’ll find the reference number on letters from the court or tribunal.'
  element :dont_have_reference_number_copy, '.text', text: "Answer 'no' to this question if you don’t have a reference number (this might be because your case hasn’t started yet)."
end
