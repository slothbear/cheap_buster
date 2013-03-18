require 'sinatra'
require_relative 'nextbus'
include Nextbus

get '/' do
  '<p>
    Read more about
    <a href="http://github.com/slothbear/cheap_buster">Cheap Buster</a>
  </p>'
end

get '/:stop_id' do
  stop_id = params[:stop_id]
  "Predictions for stop #{stop_id}: #{predictions(stop_id)}"
end
