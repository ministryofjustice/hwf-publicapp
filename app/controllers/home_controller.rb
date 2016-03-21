class HomeController < ApplicationController
  def index
  end

  def summary
    @summary = Views::Summary.new(session)
  end

  def confirmation
    @response = { result: true, message: 'HWF-16-1234' }
    reset_session
  end
end
