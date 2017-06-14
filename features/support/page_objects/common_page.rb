class CommonPage < BasePage
  section :content, '#content' do
    element :p, 'p'
    element :page_header, 'h1'
    section :text, '.text' do
      elements :p, 'p'
      elements :li, 'li'
      elements :hint, '.hint'
    end
    sections :form_group, '.form-group' do
      element :help_with, 'details > summary'
    end
  end

  elements :block, '.block'
  element :restart_application, '.restart-application'
  section :restart_confirm, '.restart-confirm' do
    elements :p, 'p'
    elements :button, 'button'
  end
  section :error_summary, '.error-summary' do
    element :error_summary_heading, '#error-summary-heading-example-1'
    element :link, 'a'
  end
  elements :error_message, '.error-message'
  element :continue_button, '#continue-button'

  def load_page(page_version = nil)
    load(v: page_version)
  end
end
