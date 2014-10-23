module Health
  class HealthController < ActionController::Base
    def show
      payload = {
        name: Rails.application.class.parent_name.underscore,
        hostname: Socket.gethostname,
        revision: revision,
        pid: Process.pid,
        parent_id: Process.ppid,
        platform: {
          name: "rails",
          version: Rails.version,
        },
      }

      render json: payload
    end

    private

    def revision_file
      Rails.root.join("REVISION")
    end

    def revision
      return unless revision_file.exist?

      revision_file.read.chomp
    end
  end
end
