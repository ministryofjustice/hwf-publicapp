class SummariesController < ApplicationController
  after_action :suppress_browser_cache

  def show
    @summary = Views::Summary.new(session)
  end
end
