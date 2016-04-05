class HomeController < ApplicationController
  def index
  end

  def summary
    @summary = Views::Summary.new(session)
  end

  def terms_and_conditions
  end
end
