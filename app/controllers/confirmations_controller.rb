class ConfirmationsController < ApplicationController
  def show
    @online_application = online_application
    @result = storage.submission_result
    ga_events << build_ga_event
    storage.clear
  end

  private

  def build_ga_event
    time = storage.time_taken < 0 ? 1000 : storage.time_taken
    type = online_application.benefits ? 'benefit' : 'income'
    "ga('send', 'timing', 'Application', 'Complete', #{time}, '#{type}')"
  end
end
