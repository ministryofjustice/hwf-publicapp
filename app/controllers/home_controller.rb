class HomeController < ApplicationController
  def index
  end

  def marital_status
    @marital_status = MaritalStatus.new
  end

  def marital_status_save
    session[:marital_status] = params["marital_status"]["married"]
    redirect_to :summary
  end

  def summary
    @marital_status = session[:marital_status]
  end
end
