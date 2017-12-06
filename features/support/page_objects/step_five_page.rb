class StepFivePage < BasePage
  section :content, '#content' do
    sections :form_group, '.form-group' do
      element :over_61_true, '#savings_and_investment_extra_over_61_true'
      element :over_61_false, '#savings_and_investment_extra_over_61_false'
      element :yes, '.block-label', text: 'Yes'
      element :no, '.block-label', text: 'No'
      element :how_much_label, '#amount-panel > div > label'
      element :extra_amount, '#savings_and_investment_extra_amount'
    end
  end
end
