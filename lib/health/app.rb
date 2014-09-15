require "socket"

module Health
  class App
    def initialize(app)
      @app = app
    end

    def call(env)
      if ["/health", "/health.json"].include?(env['PATH_INFO'])
        payload = {
          name: Rails.application.class.parent_name.underscore,
          hostname: Socket.gethostname,
          revision: ENV.fetch("REVISION", `git rev-parse HEAD`.strip),
          pid: Process.pid,
          parent_id: Process.ppid,
          platform: {
            name: "rails",
            version: Rails.version,
          },
        }

        [200, {"Content-type" => "application/json"}, [payload.to_json]]
      else
        @app.call(env)
      end
    end
  end
end
