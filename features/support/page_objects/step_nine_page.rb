class StepNinePage < BasePage
  section :content, '#content' do
    element :page_header, 'h1'
    section :text, '.text' do
      element :p, 'p'
      elements :li, 'li'
      elements :hint, '.hint'
    end
    sections :form_group, '.form-group' do
      element :h3, 'h3'
      element :applicant, '#applicant'
      elements :block_label, '.block-label'
      elements :input, '.block-label input'
      element :continue_button, '.button'
    end
  end

  def load_page(page_version = nil)
    load(v: page_version)
  end
end
