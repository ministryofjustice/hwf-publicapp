class SubmissionsController < ApplicationController
  def create
    response = submit_service.post(builder.online_application)
    storage.submission_result = response

    redirect_to(redirect_path(response))
  end

  def show
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

  def redirect_path(response)
    response[:result] ? { action: :show } : summary_path
  end
end
