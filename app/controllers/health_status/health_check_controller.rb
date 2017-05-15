# frozen_string_literal: true
module HealthStatus
  class HealthCheckController < ApplicationController
    def show
      health_check = HealthStatus::HealthCheck.new
      render json: health_check, status: health_check.healthy? ? 200 : 500
    end
  end
end
