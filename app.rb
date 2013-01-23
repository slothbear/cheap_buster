require 'sinatra'
require_relative 'nextbus'
include Nextbus

get '/' do
  'To see predictions for a stop, add the stop identifier
     to the URL. For instance: cheapbuster.herokuapp.com/00072'
end

get '/:stop_id' do
  stop_id = params[:stop_id]
  "Predictions for stop #{stop_id}: #{predictions(stop_id)}"
end
