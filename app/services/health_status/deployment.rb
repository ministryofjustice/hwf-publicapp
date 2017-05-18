module HealthStatus
  class Deployment
    def as_json(_options = {})
      {
        version_number: Settings.health_status.deployment.version_number,
        build_date: Settings.health_status.deployment.build_date,
        commit_id: Settings.health_status.deployment.commit_id,
        build_tag: Settings.health_status.deployment.build_tag
      }
    end
  end
end
