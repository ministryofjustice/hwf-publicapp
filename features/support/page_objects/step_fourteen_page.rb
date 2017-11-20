class StepFourteenPage < BasePage
  elements :block_label, '.block-label'
  element :dob_date_of_birth, '#dob_date_of_birth'
  element :hint, '.hint'
  sections :form_group, '.form-group' do
    section :details_content, '#details-content-0' do
      sections :li, 'li' do
        element :a, 'a'
      end
      elements :p, 'p'
    end
  end
end
