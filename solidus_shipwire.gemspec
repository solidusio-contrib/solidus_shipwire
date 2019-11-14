# frozen_string_literal: true

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'solidus_shipwire'
  s.version     = '1.0.0'
  s.summary     = 'Solidus shipwire integration'
  s.description = 'This extension provide the ability to connect in a easy ' \
                  'way your store and shipwire through API and Webhooks'
  s.required_ruby_version = '>= 1.8.7'

  s.author   = 'Daniele Palombo'
  s.email    = 'danielepalombo@nebulab.it'
  s.homepage = 'http://github.com/solidusio-contrib/solidus_shipwire'

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- spec/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  solidus_version = ['>= 1.0', '< 3']
  s.add_dependency 'active_model_serializers', '>= 0.10.0'
  s.add_dependency 'activerecord', ['>= 4.0']
  s.add_dependency 'retriable'
  s.add_dependency 'shipwire', '~> 2.0'
  s.add_dependency 'solidus_backend', solidus_version
  s.add_dependency 'solidus_core', solidus_version
  s.add_dependency 'solidus_support'

  s.add_development_dependency 'solidus_extension_dev_tools'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'webmock'
end
