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
  element :restart_application, 'input[value="Cancel application"]'
  section :restart_confirm, '.restart-confirm' do
    element :are_you_sure, 'p', text: 'Are you sure you want to cancel your application?'
    element :if_you_cancel, 'p', text: 'If you cancel, details for your current application will be deleted.'
    element :yes_button, '.button', text: 'Yes, cancel'
    element :no_button, '.button', text: 'No, return to current application'
  end
  section :error_summary, '.error-summary' do
    element :error_summary_heading, '#error-summary-heading-example-1'
    element :link, 'a'
  end
  elements :error_message, '.error-message'
  element :js_print, '.js-print'
end

def continue
  common_page.content.continue_button.click
end
