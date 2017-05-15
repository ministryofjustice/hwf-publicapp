# frozen_string_literal: true
module HealthStatus
  class HealthCheck
    def initialize
      check_submission_api!
      downstream_api_ok?
    end

    def as_json(_options = {}) # rubocop:disable Metrics/MethodLength
      {
        submission_api: {
          description: 'Submission API',
          ok: @submission_api_available
        },
        downstream_api_ok: {
          description: 'Downstream API',
          ok: @downstream_api_ok
        },
        ok: @submission_api_available && @downstream_api_ok
      }
    end

    def healthy?
      @submission_api_available
    end

    private

    def check_submission_api!
      service = SubmitApplication.new(Settings.submission.url, Settings.submission.token)
      @submission_api_available = service.available?
    end

    def downstream_api_ok?
      @downstream_api_ok = staff_app_health_check_result
    end

    def staff_app_health_check_result
      json = JSON.parse(RestClient.get("#{Settings.submission.url}/healthcheck.json"))
      json['ok']
    rescue
      false
    end
  end
end
