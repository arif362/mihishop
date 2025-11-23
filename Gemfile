source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '3.3.4'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 8.0'
gem 'jquery-rails'
# Use sqlite3 as the database for Active Record
# gem 'mysql2', '>= 0.3.13', '< 0.5', require: false
# mysql2 0.5+ is required for modern Rails versions
gem 'mysql2', '>= 0.5.5', require: false
# Use Puma as the app server
# gem 'puma', '~> 3.7'
# Puma 6+ is required for Rack 3 and Rails 7.2
gem 'puma', '~> 6.0'
# Use SCSS for stylesheets
# gem 'sass-rails', '~> 5.0'
# Use sassc-rails as the Sass implementation for newer Rails
gem 'sassc-rails'
# Use Uglifier as compressor for JavaScript assets
# gem 'uglifier', '>= 1.3.0'
# JavaScript compression/bundling is typically handled by jsbundling-rails in Rails 7; remove uglifier
# gem 'therubyracer', platforms: :ruby
## Remove therubyracer; prefer a Node.js runtime in modern Rails apps
## If you need an embedded JS runtime, consider 'mini_racer' explicitly.
gem 'jquery-ui-rails'

# CoffeeScript is deprecated in Rails 8; convert .coffee files to .js or use a modern bundler
# gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem 'turbolinks', '~> 5'
# Turbo (Hotwire) replaces Turbolinks in Rails 7; add turbo-rails and migrate JS where needed
gem 'turbo-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.13'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'devise'
gem 'devise_token_auth'
gem 'cancancan'
gem 'friendly_id', '~> 5.5'

gem 'bootstrap-sass', '~> 3.4'
gem 'carrierwave', '~> 3.0'
gem 'ckeditor', github: 'galetahub/ckeditor'
gem 'social-share-button'
gem 'kaminari'
gem 'bootstrap4-kaminari-views'
gem 'select2-rails' #, '~> 3.5.9.1'
gem 'annotate'
gem 'paypal-sdk-merchant'
gem 'mini_magick'

# Consider adding the Rails 7 asset helpers if you plan to migrate JS/CSS to the new bundlers:
# gem 'jsbundling-rails'
# gem 'cssbundling-rails'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :windows]
  # Update Capybara for newer Rails/Ruby
  gem 'capybara', '>= 3.35'
  gem 'selenium-webdriver'
  gem 'rspec-rails'
  gem 'simplecov', require: false
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rails-controller-testing'

  gem 'capistrano',         require: false
  gem 'capistrano-rvm',     require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
end

group :test do
  gem 'database_cleaner'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  gem 'listen', '>= 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # mutex_m is required for Ruby 3.4+ compatibility
  gem 'mutex_m'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:windows, :jruby]
gem 'rack-cors', :require => 'rack/cors'
gem 'execjs'
