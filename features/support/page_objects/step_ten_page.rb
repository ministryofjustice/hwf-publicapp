class StepTenPage < BasePage
  section :content, '#content' do
    section :text, '.text' do
      elements :li, 'li'
    end
    sections :form_group, '.form-group' do
      element :income_amount, '#income_amount_amount'
    end
  end
end
