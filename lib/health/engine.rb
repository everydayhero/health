module Health
  class Engine < ::Rails::Engine
    isolate_namespace Health

    config.health = ActiveSupport::OrderedOptions.new
    config.health.revision = ->(env) do
      if env.production?
        Rails.root.join("REVISION").read.chomp
      else
        `git rev-parse HEAD`.chomp
      end
    end

    config.to_prepare { Engine.setup!(Rails.env) }

    def self.setup!(env)
      Health.revision = config.health.revision.call(env)
    end
  end
end
