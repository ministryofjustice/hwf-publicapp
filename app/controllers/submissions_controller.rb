class SubmissionsController < ApplicationController
  def create
    builder = OnlineApplicationBuilder.new(session)
    submit_service = SubmitApplication.new(Settings.submission.url, Settings.submission.token)
    response = submit_service.post(builder.online_application)
    session[:submission_response] = response

    if response[:result]
      redirect_to(action: :show)
    else
      redirect_to(summary_path)
    end
  end

  def show
    @response = { result: true, message: 'HWF-16-1234' }
    reset_session
  end
end
