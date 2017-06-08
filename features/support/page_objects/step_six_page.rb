class StepSixPage < BasePage
  section :content, '#content' do
    sections :text, '.text' do
      elements :p, 'p'
      elements :li, 'li'
      elements :hint, '.hint'
    end
    sections :form_group, '.form-group' do
      elements :block_label, '.block-label'
      element :benefits_true, '#benefit_on_benefits_true'
      element :benefits_false, '#benefit_on_benefits_false'
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
