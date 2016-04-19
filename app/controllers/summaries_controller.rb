class SummariesController < ApplicationController
  def show
    @summary = Views::Summary.new(session)
  end
end
