class HomeController < ApplicationController
  def index
  end

  def marital_status
    @marital_status = MaritalStatus.new
  end

  def marital_status_save
    redirect_to :summary
  end

  def summary
  end
end
