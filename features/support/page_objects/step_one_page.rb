class StepOnePage < BasePage
  set_url '/session/start'

  section :content, '#content' do
    element :hint, '.text'
    section :new_form_name, '#new_form_name' do
      sections :form_group, '.form-group' do
        element :label, '.form-label'
        element :form_name_identifier, '#form_name_identifier'
        elements :block_label, '.block-label'
        element :form_name_unknown, '#form_name_unknown'
        elements :details_content, '#details-content-0 > p'
      end
    end
  end

  def load_page(page_version = nil)
    load(v: page_version)
  end
end
