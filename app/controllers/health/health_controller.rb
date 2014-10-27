module Health
  class HealthController < ActionController::Base
    def show
      payload = {
        name: Rails.application.class.parent_name.underscore,
        hostname: Socket.gethostname,
        revision: Health.revision,
        pid: Process.pid,
        parent_id: Process.ppid,
        platform: {
          name: "rails",
          version: Rails.version,
        },
      }

      render json: payload
    end
  end
end
