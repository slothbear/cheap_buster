module Nextbus
  def self.predictions(stop_id)
    query_nextbus(stop_id).collect do |prediction|
      prediction['minutes']
    end
  end

  def self.query_nextbus(stop_id)
    base_uri = 'http://webservices.nextbus.com/service/publicXMLFeed'
    query = { :command => 'predictions', :a => 'mbta', :stopId => "#{stop_id}" }

    response = HTTParty.get(base_uri, query: query)
    response.parsed_response['body']['predictions']['direction']['prediction']
  end
end