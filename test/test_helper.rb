ENV['RACK_ENV'] = 'test'

require 'bundler/setup'
Bundler.require :default, :test

require_relative '../app.rb'

require 'minitest/autorun'
require 'minitest/pride'
include Rack::Test::Methods

include Capybara::DSL
Capybara.app = Sinatra::Application

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
