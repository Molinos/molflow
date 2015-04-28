# coding: utf-8
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
require 'molflow/version'

Gem::Specification.new do |s|
  s.name        = 'molflow'
  s.version     = Molflow::VERSION
  s.licenses    = ['MIT']
  s.authors     = ["Dmitry Silaev"]
  s.email       = ["dmsilaev@yandex.ru"]
  s.summary     = %q{Workflow in Molinos}
  s.description = %q{Workflow in Molinos}
  s.files       = `git ls-files`.split($/)

  s.required_ruby_version     = '>= 1.9.3'
  s.add_dependency "thor", "~> 0.14"
  s.add_dependency 'jira-ruby','~> 0.1'

  s.add_development_dependency "bundler", "~> 1.7"
  s.add_development_dependency "rake", "~> 10.4"

  s.executables   = %w(molflow mf)
  s.require_paths = ["lib"]
end