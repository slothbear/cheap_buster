ENV['RACK_ENV'] = 'test'

require 'bundler/setup'
Bundler.require :default, :test

require_relative '../app.rb'
require 'minitest/autorun'
include Rack::Test::Methods

def app
  Sinatra::Application
end
