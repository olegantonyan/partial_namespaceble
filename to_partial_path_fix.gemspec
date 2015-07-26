# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'to_partial_path_fix/version'

Gem::Specification.new do |spec|
  spec.name          = "to_partial_path_fix"
  spec.version       = ToPartialPathFix::VERSION
  spec.authors       = ["Oleg Antonyan"]
  spec.email         = ["oleg.b.antonyan@gmail.com"]

  spec.summary       = %q{Monkey-patch for to_partial_path on namespaced models}
  spec.description   = %q{If you have a namespaced model, like `User::Profile` and want to render partial like `render @user.profile`, you find that it tryes to find `profile` partial in `user/profiles/profile`. But you've got `users/` folder already! Why don't use it as a parent directory for nested models? I hope this will be fixed in rails soon }
  spec.homepage      = "http://example.com"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "activemodel", ">= 3.2.22"
  spec.add_development_dependency "activesupport", ">= 3.2.22"
  spec.add_development_dependency "rspec"
end
