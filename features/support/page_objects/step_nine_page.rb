class StepNinePage < BasePage
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
      element :income_range_less, '#income_range_choice_less'
      element :income_range_between, '#income_range_choice_between'
      element :income_range_more, '#income_range_choice_more'
      element :continue_button, '.button'
    end
  end

  def load_page(page_version = nil)
    load(v: page_version)
  end
end
