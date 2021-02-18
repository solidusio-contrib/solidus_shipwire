# frozen_string_literal: true

$:.push File.expand_path('lib', __dir__)
require 'solidus_shipwire/version'

Gem::Specification.new do |s|
  s.name = 'solidus_shipwire'
  s.version =   SolidusShipwire::VERSION
  s.summary = 'Solidus shipwire integration'
  s.description = 'This extension provide the ability to connect in a easy ' \
                  'way your store and shipwire through API and Webhooks'
  s.license = 'BSD-3-Clause'

  s.author = 'Daniele Palombo'
  s.email = 'danielepalombo@nebulab.it'
  s.homepage = 'http://github.com/solidusio-contrib/solidus_shipwire'

  if s.respond_to?(:metadata)
    s.metadata["homepage_uri"] = s.homepage if s.homepage
    s.metadata["source_code_uri"] = s.homepage if s.homepage
  end

  s.required_ruby_version = '~> 2.4'

  s.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  s.test_files = Dir['spec/**/*']
  s.bindir = "exe"
  s.executables = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]

  solidus_version = ['>= 1.0', '< 3']
  s.add_dependency 'solidus_backend', solidus_version
  s.add_dependency 'solidus_core', solidus_version

  s.add_dependency 'active_model_serializers', '>= 0.10.0'
  s.add_dependency 'activerecord', ['>= 4.0']
  s.add_dependency 'retriable'
  s.add_dependency 'shipwire', '~> 2.0'
  s.add_dependency 'solidus_support', '>= 0.4', '< 0.9'

  s.add_development_dependency 'solidus_dev_support'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'webmock'
end
