class CommonPage < BasePage
  section :content, '#content' do
    element :p, 'p'
    element :h1, 'h1'
    element :h2, 'h2'
    section :text, '.text' do
      elements :p, 'p'
      elements :li, 'li'
      elements :hint, '.hint'
    end
    sections :form_group, '.form-group' do
      element :help_with, 'details > summary'
    end
  end

  element :heading_secondary, '.heading-secondary'
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
  element :js_print, '.js-print'
  element :continue_button, '#continue-button'
  element :button, '.button'

  def load_page(page_version = nil)
    load(v: page_version)
  end
end
