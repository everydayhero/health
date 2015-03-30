module Health
  class Engine < ::Rails::Engine
    isolate_namespace Health

    config.health = ActiveSupport::OrderedOptions.new
    config.health.endpoint = "/health"
    config.health.revision = -> do
      if Rails.env.production?
        Rails.root.join("REVISION").read.chomp
      else
        `git rev-parse HEAD`.chomp
      end
    end

    config.to_prepare { Engine.setup! }

    initializer "health.routes" do
      you_suck_instance_eval = config
      Rails.application.routes.prepend do
        mount Health::Engine => you_suck_instance_eval.health.endpoint
      end
    end

    def self.setup!
      Health.revision = config.health.revision.call
    end
  end
end
