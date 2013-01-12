require 'sinatra'

get '/' do
  'To see predictions for a stop, add the stop identifier
     to the URL. For instance: cheapbuster.herokuapp.com/00072'
end

get '/:stop_id' do
  "Predictions for stop #{params[:stop_id]}:
     #{rand(10)}, #{rand(10)+10}, #{rand(10)+20}"
end