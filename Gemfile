source 'https://rubygems.org'

ruby '2.2.1'

gem 'slim'

gem 'guard'
gem 'guard-rspec'

# Server requirements
gem 'thin'

# Project requirements
gem 'rake'
gem 'erubis'

# Test requirements
group :staging, :production, :development, :test do
  gem 'dm-postgres-adapter'
end

# Padrino Stable Gem
gem 'padrino', '0.12.5'

# Component requirements
gem 'padrino-sprockets', :require => "padrino/sprockets"

gem 'cucumber'
gem 'capybara'
gem 'selenium-webdriver'

gem 'rspec_junit_formatter'
gem 'rspec'

group :development do
  gem 'byebug'
end