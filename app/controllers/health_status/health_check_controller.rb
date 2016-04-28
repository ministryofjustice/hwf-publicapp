module HealthStatus
  class HealthCheckController < ApplicationController
    def show
      health_check = HealthStatus::HealthCheck.new
      render json: health_check, status: health_check.status ? 200 : 500
    end
  end
end
