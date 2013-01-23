module Nextbus
  def predictions(stop_id)
    response = query_nextbus(stop_id)
    response['predictions'].count
  end

  def query_nextbus(stop_id)
    base_uri = 'http://webservices.nextbus.com/service/publicXMLFeed'
    query = { :command => 'predictions',
      :a => 'mbta',
      :stopId => "#{stop_id}"
      }
    response = HTTParty.get(base_uri, query: query)
    response.parsed_response['body']
  end
end