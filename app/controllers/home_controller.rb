class HomeController < ApplicationController
  def index
  end

  def summary
    @summary = Views::Summary.new(session)
  end
end
