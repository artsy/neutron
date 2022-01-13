source "https://rubygems.org"

ruby "3.1.0"

gem "rails", "7.0.1"

gem "bootsnap", require: false
gem "decent_exposure"
gem "faraday"
gem "friendly_id"
gem "graphql"
gem "graphql-page_cursors"
gem "graphql-rails_logger"
gem "haml"
gem "importmap-rails"
gem "jbuilder"
gem "pg"
gem "puma"
gem "redis"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"

group :development do
  gem "graphiql-rails"
  gem "web-console"
end

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'webdrivers'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webmock'
end
