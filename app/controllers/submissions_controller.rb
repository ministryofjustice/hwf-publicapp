class SubmissionsController < ApplicationController
  def create
    response = submit_service.post(builder.online_application)
    storage.submission_result = response

    if response[:result]
      redirect_to(action: :show)
    else
      flash[:error] = "We couldn't process your application at this time. Please try again later."
      redirect_to(summary_path)
    end
  end

  def show
    @online_application = builder.online_application
    @result = storage.submission_result
    reset_session
  end

  private

  def submit_service
    @submit_service ||= SubmitApplication.new(Settings.submission.url, Settings.submission.token)
  end

  def builder
    @builder ||= OnlineApplicationBuilder.new(storage)
  end
end
