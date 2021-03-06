class SessionsController < ApplicationController
  # This is implemented as a GET method, because we won't have controll over
  # the page with the Start button that page will be managed by GOV.UK, so
  # we can't make it POST because of XSS restriction
  def start
    storage_with_clear.start
    redirect_to(question_path(QuestionFormFactory::IDS.first))
  end

  def finish
    storage.clear
    redirect_path = Rails.application.config.finish_page_redirect_url || root_path
    redirect_to(redirect_path)
  end

  def destroy
    storage_with_clear
    redirect_to(root_path)
  end

  private

  def storage_with_clear
    Storage.new(session, clear: true)
  end
end
