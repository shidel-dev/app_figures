# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'appfigures/version'

Gem::Specification.new do |spec|
  spec.name          = "appfigures"
  spec.version       = Appfigures::VERSION
  spec.authors       = ['StyleSeek Engineering']
  spec.email         = ['engineering@styleseek.com']
  spec.summary       = %q{Simple API Client for AppFigures.com}
  spec.description   = %q{Simple Ruby client for tracking mobile applications with AppFigures.com's api.}
  spec.homepage      = "https://github.com/styleseek/appfigures"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty", "~> 0.13"
  spec.add_dependency "multi_json", "~> 1.10"
end