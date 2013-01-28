require 'sinatra'
require_relative 'nextbus'
include Nextbus

get '/' do
  '<p>To see predictions for a stop, add the stop identifier
  to the URL. For instance:
  <pre>cheapbuster.herokuapp.com/00072</pre>
  </p>

  <p>Look up MBTA stop identifiers at
  <a href="http://www.nextbus.com/predictor/stopSelector.jsp?a=mbta">
  NextBus</a>.</p>

  <p>Cheap Buster has only been tested with the MBTA so far.
  If you would like to use it with a different transit
  system, let me know
  or send a pull request.</p>'
end

get '/:stop_id' do
  stop_id = params[:stop_id]
  "Predictions for stop #{stop_id}: #{predictions(stop_id)}"
end
