class HomeController < ApplicationController
  def index
  end

  def marital_status
    @marital_status = MaritalStatus.new
  end
end
