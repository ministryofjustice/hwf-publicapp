class StepOnePage < BasePage
  set_url 'session/start'

  section :content, '#content' do
    element :p, 'p'
    element :page_header, 'h1'
    section :error_summary, '.error-summary' do
      element :h2, 'h2'
      element :visuallyhidden, '.visuallyhidden'
      element :error_link, '.error-link'
    end
    element :hint, '.text'
    section :new_form_name, '#new_form_name' do
      sections :form_group, '.form-group' do
        element :label, '.form-label'
        element :error_message, '.error-message'
        element :form_name_identifier, '#form_name_identifier'
        elements :block_label, '.block-label'
        element :form_name_unknown, '#form_name_unknown'
        element :form_name_et, '#form_name_et'
        element :summary, 'summary'
        elements :details_content, '#details-content-0 > p'
        element :continue_button, '.button'
      end
    end
  end

  elements :block, '.block'
  element :restart_application, '.restart-application'
  section :restart_confirm, '.restart-confirm' do
    elements :p, 'p'
    elements :button, 'button'
  end

  def load_page(page_version = nil)
    load(v: page_version)
  end
end
