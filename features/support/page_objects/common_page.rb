class CommonPage < BasePage
  section :content, '#content' do
    element :p, 'p'
    element :h1, 'h1'
    element :h2, 'h2'
    element :there_is_a_problem, '.error-summary', text: 'There is a problem'
    section :text, '.text' do
      elements :p, 'p'
      elements :li, 'li'
      elements :hint, '.hint'
    end
    element :continue_button, 'input[value="Continue"]'
  end
  element :help_with, 'details > summary'

  element :heading_secondary, '.heading-secondary'
  elements :block, '.block'
  section :error_summary, '.error-summary' do
    element :error_summary_heading, '#error-summary-heading-example-1'
    element :link, 'a'
  end
  elements :error_message, '.error-message'
  element :js_print, '.js-print'
end
