class StepTenPage < BasePage
  section :content, '#content' do
    element :page_header, 'h1'
    section :text, '.text' do
      elements :p, 'p'
      elements :li, 'li'
      elements :hint, '.hint'
    end
    sections :form_group, '.form-group' do
      element :h3, 'h3'
      elements :block_label, '.block-label'
      elements :input, '.block-label input'
      element :income_amount, '#income_amount_amount'
      element :continue_button, '.button'
    end
  end

  def load_page(page_version = nil)
    load(v: page_version)
  end
end
