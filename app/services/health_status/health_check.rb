module HealthStatus
  class HealthCheck
    def initialize
      check_submission_api!
    end

    def as_json(_options = {})
      {
        submission_api: {
          description: 'Submission API',
          ok: @submission_api_available
        },
        ok: @submission_api_available
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
  end
end
