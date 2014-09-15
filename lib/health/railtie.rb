module Health
  class Railtie < Rails::Railtie
    initializer "health.add_middleware" do |app|
      app.middleware.insert_after(ActionDispatch::RequestId, Health::App)
    end
  end
end
