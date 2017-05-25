class StepSixPage < BasePage
  section :content, '#content' do
    element :married_reminder, '#content > div:nth-child(3) > p'
    element :page_header, 'h1'
    sections :text, '.text' do
      elements :p, 'p'
      elements :li, 'li'
      elements :hint, '.hint'
    end
    sections :form_group, '.form-group' do
      elements :block_label, '.block-label'
      element :benefits_true, '#benefit_on_benefits_true'
      element :benefits_false, '#benefit_on_benefits_false'
      element :how_much_label, '#amount-panel > div > label'
      element :extra_amount, '#savings_and_investment_extra_amount'
      element :continue_button, '.button'
      section :details_content, '#details-content-0' do
        elements :heading_small, '.heading-small'
        sections :ul, 'ul' do
          elements :li, 'li'
          elements :hint, '.hint'
        end
      end
    end
  end

  def load_page(page_version = nil)
    load(v: page_version)
  end
end
