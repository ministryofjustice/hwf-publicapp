class StepSevenPage < BasePage
  section :content, '#content' do
    sections :text, '.text' do
      elements :p, 'p'
      elements :li, 'li'
    end
    sections :form_group, '.form-group' do
      elements :block_label, '.block-label'
      element :dependent_children_true, '#dependent_children_true'
      element :children_number, '#dependent_children_number'
      element :dependent_children_false, '#dependent_children_false'
      section :details_content, '#details-content-0' do
        elements :p, 'p'
        sections :li, 'li' do
          element :external, '.external'
        end
      end
    end
  end
end
