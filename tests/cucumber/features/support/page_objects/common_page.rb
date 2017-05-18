# frozen_string_literal: true
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
  end

  def load_page(page_version = nil)
    load(v: page_version)
  end
end
