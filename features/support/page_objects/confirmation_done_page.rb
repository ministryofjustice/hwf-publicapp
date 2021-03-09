class ConfirmationDonePage < BasePage
  set_url '/confirmation/done'

  section :content, '#content' do
    element :step_info, '.govuk-caption-l', text: 'Step 22 of 22'
    element :header, 'h1', text: 'Send your claim form'
    element :send_your_form, 'h2', text: 'Send your C100 form with your HWF-000-000 reference on it to complete the process'
    element :post, '.post', text: 'Deliver your paperwork to the court or tribunal dealing with your case. You can do this by post or in person.'
    section :what_happens_next, '.steps-panel' do
      element :one, 'li', text: 'Your application will be assessed by court or tribunal staff. This usually takes no longer than 21 days.'
      element :two, 'li', text: 'You\'ll hear from the court or tribunal if your application is unsuccessful or if they need more information from you.'
      element :three, 'li', text: 'If your application is successful you\'ll hear directly from the court or tribunal dealing with your case.'
    end
    element :finish_application_button, 'input[value="Finish application"]'
  end

  def submit
    Rails.application.config.finish_page_redirect_url = '/'
    content.finish_application_button.click
  end

end
