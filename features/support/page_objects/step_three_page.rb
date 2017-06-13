class StepThreePage < BasePage
  section :content, '#content' do
    sections :form_group, '.form-group' do
      elements :block_label, '.block-label'
      element :marital_status_married_false, '#marital_status_married_false'
      element :marital_status_married_true, '#marital_status_married_true'
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
