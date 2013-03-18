require_relative 'test_helper'

class AppTest < MiniTest::Unit::TestCase

  def test_record_predictions
    VCR.use_cassette('predictions') do
     response = HTTParty.get('http://webservices.nextbus.com/service/publicXMLFeed',
       :query => {
         :command => 'predictions',
         :a => 'mbta',
         :stopId => '00072'
         })
     assert_match /Massachusetts Ave @ Pearl St/, response.body
    end
  end

end
