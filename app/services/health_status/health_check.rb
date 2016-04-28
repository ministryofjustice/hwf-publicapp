module HealthStatus
  class HealthCheck
    def initialize
    end

    def as_json(_options = {})
      {
        submission_api: {
          description: 'Submission API',
          ok: true
        },
        ok: status
      }
    end

    def status
      true
    end
  end
end
