# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'random_id/version'

Gem::Specification.new do |spec|
  spec.name          = "random_id"
  spec.version       = RandomId::VERSION
  spec.authors       = ["Junya Wako"]
  spec.email         = ["j.wako@j-q.co.jp"]
  spec.summary       = %q{RandomId is easy to generate random uniq id with any length of string.}
  spec.description   = %q{It can be used for ids in FriendlyId gem.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'activesupport', ['>= 3.0.0']
  spec.add_dependency 'activerecord', ['>= 3.0.0']

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
