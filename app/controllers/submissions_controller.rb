class SubmissionsController < ApplicationController
  def create
    redirect_to(action: :show)
  end

  def show
    @response = { result: true, message: 'HWF-16-1234' }
    reset_session
  end
end
