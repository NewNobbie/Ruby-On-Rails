source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.2.2"

# Use sqlite3 as the database for Active Record
gem "sqlite3", ">= 1.4"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[windows jruby]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Development and Test groups
group :development, :test do
  # Debugging tool for Rails
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false

  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem "rubocop-rails-omakase", require: false
end

group :test do
  # Mocking and stubbing library
  gem "mocha"
end

gem 'dotenv-rails', groups: [:development, :test]

# Commented out gems for optional features or unused features
# gem "jbuilder" # For JSON APIs
# gem "redis", ">= 4.0.1" # Redis adapter for Action Cable
# gem "kredis" # Higher-level data types in Redis
# gem "bcrypt", "~> 3.1.7" # For secure password hashing
# gem "image_processing", "~> 1.2" # Active Storage variants support

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS)
# gem "rack-cors"


