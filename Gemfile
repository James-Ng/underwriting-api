source 'https://rubygems.org'

gem 'rails', '4.2.2'

gem 'rails-api', '0.4.0'



group :test, :development do
  gem 'rspec-rails', '3.1.0'
  gem 'factory_girl_rails', '4.5.0'
  gem 'ffaker', '2.1.0'
  gem 'guard-rspec', '4.6.4', require: false
  gem 'shoulda-matchers', '2.8.0', require: false
  gem 'simplecov', :require => false
  gem 'database_cleaner'
  gem 'sqlite3', '1.3.11'
end
group :production do
  gem 'pg'
  gem 'rails_12factor'
end
group :development do
  gem 'rubocop', require: false
  gem 'spring', '1.5.0'
end
