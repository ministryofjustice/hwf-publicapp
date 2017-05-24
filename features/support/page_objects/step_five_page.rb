class StepFivePage < BasePage
  section :content, '#content' do
    element :married_reminder, '#content > div:nth-child(3) > p'
    element :page_header, 'h1'
    sections :form_group, '.form-group' do
      element :over_61_true, '#savings_and_investment_extra_over_61_true'
      element :over_61_false, '#savings_and_investment_extra_over_61_false'
      elements :block_label, '.block-label'
      element :how_much_label, '#amount-panel > div > label'
      element :extra_amount, '#savings_and_investment_extra_amount'
      element :continue_button, '.button'
    end
  end

  def load_page(page_version = nil)
    load(v: page_version)
  end
end
