source 'https://rubygems.org'

ruby IO.read('.ruby-version').strip

gem 'faraday'
gem 'mechanize'
gem 'redis'
gem 'redis-namespace'
gem 'sinatra'

group :test, :development do
  gem 'fakeredis', require: 'fakeredis/rspec'
  gem 'pry'
  gem 'rspec'
  gem 'rack-test'
end
