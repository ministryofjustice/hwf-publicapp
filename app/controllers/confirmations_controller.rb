# frozen_string_literal: true
class ConfirmationsController < ApplicationController
  before_action :redirect_if_storage_unstarted
  after_action :suppress_browser_cache

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
    time = calculate_time_taken
    type = online_application.benefits ? 'benefit' : 'income'
    ga_events << "ga('send', 'timing', 'Application', 'Complete', #{time}, '#{type}')"
  end

  def calculate_time_taken
    return 0 unless storage_has_time?
    storage.time_taken
  end

  def storage_has_time?
    storage.started? && storage.time_taken.positive?
  end
end
