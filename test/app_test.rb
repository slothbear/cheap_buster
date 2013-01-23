require_relative 'test_helper'

class AppTest < MiniTest::Unit::TestCase

  def test_root
    get '/'
    assert_equal 200,last_response.status
  end

  def test_prediction_handler
    get '/08819'
    assert_equal 200, last_response.status
    assert_match /stop 08819/, last_response.body
  end

  def test_stop_predictions
    VCR.use_cassette('predictions') do
      get '/00072'
      assert_match /10, 24, 39/, last_response.body
    end
  end

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
