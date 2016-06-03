class ConfirmationsController < ApplicationController
  def show
    prepare_view
    build_ga_event
  end

  def done
    prepare_view
    clear_storage
  end

  def refund
    prepare_view
    build_ga_event
    clear_storage
  end

  private

  def prepare_view
    @online_application = online_application
    @result = storage.submission_result
  end

  def clear_storage
    storage.clear
  end

  def build_ga_event
    time = storage.time_taken < 0 ? 1000 : storage.time_taken
    type = online_application.benefits ? 'benefit' : 'income'
    ga_events << "ga('send', 'timing', 'Application', 'Complete', #{time}, '#{type}')"
  end
end
