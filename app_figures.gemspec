# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'app_figures/version'

Gem::Specification.new do |spec|
  spec.name          = "app_figures"
  spec.version       = AppFigures::VERSION
  spec.authors       = ['StyleSeek Engineering']
  spec.email         = ['engineering@styleseek.com']
  spec.summary       = %q{Simple API Client for AppFigures.com}
  spec.description   = %q{Simple API Client for AppFigures.com, supports pulling in products and sales from AppFigures with Basic Auth.}
  spec.homepage      = "https://github.com/styleseek/app_figures"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = nil
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty", "~> 0.13"
  spec.add_dependency "multi_json", "~> 1.10"
end
