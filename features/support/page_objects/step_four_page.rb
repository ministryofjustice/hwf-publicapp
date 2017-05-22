class StepFourPage < BasePage
  section :content, '#content' do
    element :p, 'p'
    element :page_header, 'h1'
    sections :form_group, '.form-group' do
      elements :block_label, '.block-label'
      element :savings_and_investment_choice_less, '#savings_and_investment_choice_less'
      element :savings_and_investment_choice_between, '#savings_and_investment_choice_between'
      element :savings_and_investment_choice_more, '#savings_and_investment_choice_more'
      element :continue_button, '.button'
      element :help_with_savings_and_investments, 'details > summary'
      section :details_content, '#details-content-0' do
        elements :heading_small, '.heading-small'
        sections :ul, 'ul' do
          elements :li, 'li'
        end
      end
    end
  end

  def load_page(page_version = nil)
    load(v: page_version)
  end
end
