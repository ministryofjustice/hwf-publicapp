class SubmissionsController < ApplicationController
  def create
    response = submit_service.post(online_application)
    storage.submission_result = response

    if response[:result]
      redirect_to(action: :show)
    else
      flash[:error] = "We couldn't process your application at this time. Please try again later."
      redirect_to(summary_path)
    end
  end

  def show
    @online_application = online_application
    @result = storage.submission_result
    ga_events << build_ga_event
    reset_session
  end

  private

  def submit_service
    @submit_service ||= SubmitApplication.new(Settings.submission.url, Settings.submission.token)
  end

  def build_ga_event
    time = storage.time_taken < 0 ? 1000 : storage.time_taken
    type = online_application.benefits ? 'benefit' : 'income'
    "ga('send', 'timing', 'Application', 'Complete', #{time}, '#{type}')"
  end
end
