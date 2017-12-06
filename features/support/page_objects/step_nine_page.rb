class StepNinePage < BasePage
  section :content, '#content' do
    element :select_single_income_text, '.text', text: 'Select the monthly amount you receive in income from:'
    element :select_married_income_text, '.text', text: 'Select the monthly amount you and your partner receive in income from:'
    elements :li, 'li'
    sections :form_group, '.form-group' do
      elements :block_label, '.block-label'
      element :income_range_less, '#income_range_choice_less'
      element :income_range_between, '#income_range_choice_between'
      element :income_range_more, '#income_range_choice_more'
    end
  end
end
