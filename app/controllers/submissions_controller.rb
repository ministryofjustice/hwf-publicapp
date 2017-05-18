class SubmissionsController < ApplicationController
  def create
    response = submit_service.post(online_application)
    storage.submission_result = response

    if response[:result]
      redirect_to(confirmation_route(online_application))
    else
      flash[:error] = "We couldn't process your application at this time. Please try again later."
      redirect_to(summary_path)
    end
  end

  def confirmation_route(online_application)
    if online_application.et?
      et_confirmation_path
    elsif online_application.refund?
      refund_confirmation_path
    else
      confirmation_path
    end
  end

  private

  def submit_service
    @submit_service ||= SubmitApplication.new(Settings.submission.url, Settings.submission.token)
  end
end
