source 'https://rubygems.org'

branch = ENV.fetch('SOLIDUS_BRANCH', 'master')
gem 'solidus', github: 'solidusio/solidus', branch: branch

case ENV['DB']
when 'mysql'
  gem 'mysql2'
when 'postgresql'
  gem 'pg'
else
  gem 'sqlite3'
end

gem 'shipwire', github: 'nebulab/shipwire'
gem 'solidus_extension_dev_tools', github: 'solidusio-contrib/solidus_extension_dev_tools'

group :test do
  gem 'rails-controller-testing'
end

group :development, :test do
  gem 'i18n-tasks', '~> 0.9'
end

gemspec
