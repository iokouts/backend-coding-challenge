source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.4'

# rails
gem 'bootsnap', '>= 1.4.8', require: false
gem 'rails', '~> 6.0', '>= 6.0.3.7'
gem 'responders'

# DB
gem 'pg', '~> 1.0'
gem 'strong_migrations'

# rack
gem 'puma'

# Frontend
gem 'webpacker'

# utility
gem 'amazing_print'
gem 'oj'
gem 'oj_mimic_json'
gem 'webmock'

# api
gem 'api-pagination'
gem 'blueprinter'
gem 'pagy'

# factory_bot also used for seed data in development
gem 'factory_bot_rails', '~> 6.1.0', require: false
gem 'ffaker', '~> 2.17'

group :development do
  gem 'annotate'
  gem 'listen'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'byebug'
  gem 'countries'
end

group :test do
  gem 'database_cleaner'
  gem 'rspec-rails'
  gem 'simplecov', require: false
end
