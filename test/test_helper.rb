ENV['RACK_ENV'] = 'test'
NEXTBUS = "http://webservices.nextbus.com/service/publicXMLFeed"

require 'bundler/setup'
Bundler.require :default, :test

require_relative '../app.rb'
require_relative '../nextbus.rb'

require 'mail'
require 'minitest/autorun'
include Rack::Test::Methods

VCR.configure do |c|
  c.cassette_library_dir = 'test/cassettes'
  c.hook_into :webmock
end

Mail.defaults do
  delivery_method :test
end

def app
  Sinatra::Application
end
