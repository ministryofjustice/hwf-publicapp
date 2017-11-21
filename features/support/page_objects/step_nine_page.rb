class StepNinePage < BasePage
  section :content, '#content' do
    section :text, '.text' do
      elements :li, 'li'
    end
    sections :form_group, '.form-group' do
      elements :block_label, '.block-label'
      element :income_range_less, '#income_range_choice_less'
      element :income_range_between, '#income_range_choice_between'
      element :income_range_more, '#income_range_choice_more'
    end
  end
end
