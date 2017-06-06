class StepEightPage < BasePage
  section :content, '#content' do
    section :text, '.text' do
      elements :li, 'li'
    end
    sections :form_group, '.form-group' do
      element :h3, 'h3'
      elements :block_label, '.block-label'
      elements :input, '.block-label input'
      element :continue_button, '.button'
    end
  end

  def load_page(page_version = nil)
    load(v: page_version)
  end
end
