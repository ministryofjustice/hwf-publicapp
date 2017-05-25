class StepSevenPage < BasePage
  section :content, '#content' do
    element :married_reminder, '#content > div:nth-child(3) > p'
    element :page_header, 'h1'
    sections :text, '.text' do
      elements :p, 'p'
      elements :li, 'li'
      elements :hint, '.hint'
    end
    sections :form_group, '.form-group' do
      elements :block_label, '.block-label'
      element :dependent_children_true, '#dependent_children_true'
      element :children_number, '#dependent_children_number'
      element :dependent_children_false, '#dependent_children_false'
      element :how_much_label, '#amount-panel > div > label'
      section :details_content, '#details-content-0' do
        elements :p, 'p'
        sections :li, 'li' do
          element :external, '.external'
        end
      end
    end
    element :continue_button, '.form-group > .button'
  end

  def load_page(page_version = nil)
    load(v: page_version)
  end
end
