require 'sinatra'

get '/' do
  'Sinatra kantas.'
end

get '/:stop_id' do
  "Predictions for stop #{params[:stop_id]}:
     #{rand(10)}, #{rand(10)+10}, #{rand(10)+20}"
end