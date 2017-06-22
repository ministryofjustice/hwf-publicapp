class StepNineteenPage < BasePage
  elements :heading_secondary, '.heading-secondary'
  section :steps_panel, '.steps-panel' do
    element :h2, 'h2'
    elements :li, 'ol > li'
    element :hwf_ref, '.hwf-ref'
  end
  element :js_print, '.js-print'
  element :continue_button, '.button'

  def load_page(page_version = nil)
    load(v: page_version)
  end
end