class StepThreePage < BasePage
  section :content, '#content' do
    element :p, 'p'
    element :page_header, 'h1'
    sections :form_group, '.form-group' do
      elements :block_label, '.block-label'
      element :marital_status_married_false, '#marital_status_married_false'
      element :marital_status_married_true, '#marital_status_married_true'
      element :continue_button, '.button'
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
