$:.push File.expand_path("../lib", __FILE__)

require 'health/version'

Gem::Specification.new do |spec|
  spec.name          = "health"
  spec.version       = Health::VERSION
  spec.authors       = ["Tim Cooper"]
  spec.email         = ["coop@latrobest.com"]
  spec.summary       = "Rails application health endpoint"
  spec.description   = spec.summary
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.bindir        = "script"
  spec.executables   = spec.files.grep(%r{^script/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rubocop"

  spec.add_dependency "rails", ">= 4.0"
end
