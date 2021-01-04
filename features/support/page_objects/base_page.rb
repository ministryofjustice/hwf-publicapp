class BasePage < SitePrism::Page
  section :content, '#content' do
    element :p, 'p'
    element :h1, 'h1'
    element :h2, 'h2'
    element :there_is_a_problem, 'h2', text: 'There is a problem'
    element :step_number, '.govuk-caption-l'
    element :checklist_continue_button, '.govuk-button', text: 'Continue'
    element :continue_button, 'input[value="Continue"]'
  end
  element :help_with, 'details > summary'

  element :heading_secondary, '.heading-secondary'
  elements :block, '.block'
  section :error_summary, '.govuk-error-summary' do
    element :error_summary_heading, '.error-link'
    element :link, 'a'
  end
  elements :error_message, '.govuk-error-message'
  element :js_print, '.js-print'

  def click_help_with
    help_with.click
  end

end
