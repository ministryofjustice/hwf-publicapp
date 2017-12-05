class StepEightPage < BasePage
  section :content, '#content' do
    element :choose_income_single, '.text', text: 'Choose the different types of income you receive.'
    element :choose_income_married, '.text', text: 'Choose the different types of income you and your partner receive.'
    sections :form_group, '.form-group' do
      element :your_income, 'h3', text: 'Your income'
      element :partners_income, 'h3', text: 'Your partner\'s income'
      element :wages, '.block-label', text: 'Wages'
      element :no_income, '.block-label', text: 'No income'
      elements :block_label, '.block-label'
      elements :input, '.block-label input'
    end
    section :text, '.text' do
      elements :li, 'li'
    end
  end
end
