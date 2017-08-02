# Health

Provides a health endpoint for rails applications.

## Installation

Add this line to your application's Gemfile:

    gem "health", github: "everydayhero/health-rails"

And then execute:

    $ bundle

## Usage

```
$ curl localhost:5000/health
{"name":"mad_max","hostname":"troll.home.gateway","revision":"f211ba6f8cb9b92584bebbe8ad171639b69de816","pid":46582,"parent_id":46564,"platform":{"name":"rails","version":"4.2.0"}}
```

The default configuration pulls the revision from git in development and test
and `Rails.root.join("REVISION")` in production. The revision default can be
configured through the engine:

```
module MadMax
  class Application < Rails::Application
    # Rails.env is passed to the lambda.
    config.health.revision = ->(env) { "lol" }
  end
end
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/health/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
