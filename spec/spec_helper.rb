$: << File.join(File.dirname(__FILE__), '..')

ENV['RACK_ENV'] = 'test'

require 'fakeredis'
require 'pry'
require 'rack/test'
require 'rspec'
require 'chancellor'

RSpec.configure do |c|
  c.include Rack::Test::Methods
end

def app
  Chancellor
end
