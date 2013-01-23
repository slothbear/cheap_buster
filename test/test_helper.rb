ENV['RACK_ENV'] = 'test'

require 'bundler/setup'
Bundler.require :default, :test

require_relative '../app.rb'
require 'minitest/autorun'
include Rack::Test::Methods

VCR.configure do |c|
  c.cassette_library_dir = 'test/cassettes'
  c.hook_into :webmock
end

def app
  Sinatra::Application
end
