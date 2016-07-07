class ConfirmationsController < ApplicationController
  def show
    prepare_view
    build_ga_event
  end

  def done
    prepare_view
  end

  def refund
    prepare_view
    build_ga_event
  end

  def et
    prepare_view
    build_ga_event
  end

  private

  def prepare_view
    @online_application = online_application
    @result = storage.submission_result
  end

  def build_ga_event
    time = storage.time_taken < 0 ? 1000 : storage.time_taken
    type = online_application.benefits ? 'benefit' : 'income'
    ga_events << "ga('send', 'timing', 'Application', 'Complete', #{time}, '#{type}')"
  end
end
