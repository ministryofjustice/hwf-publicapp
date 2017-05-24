class CommonPage < BasePage
  section :content, '#content' do
    element :p, 'p'
    element :page_header, 'h1'
  end

  elements :block, '.block'
  element :restart_application, '.restart-application'
  section :restart_confirm, '.restart-confirm' do
    elements :p, 'p'
    elements :button, 'button'
    element :continue_button, '.button'
  end
  section :error_summary, '.error-summary' do
    element :error_summary_heading, '#error-summary-heading-example-1'
    element :link, 'a'
  end
  element :error_message, '.error-message'

  def load_page(page_version = nil)
    load(v: page_version)
  end
end