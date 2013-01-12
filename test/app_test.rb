require_relative 'test_helper'

class AppTest < MiniTest::Unit::TestCase

  def test_root
    get '/'
    assert_equal 200, last_response.status
    assert_equal 'Sinatra kantas.', last_response.body
  end

  def test_stop_id_predictions
    get '/08819'
    assert_equal 200, last_response.status
    assert_match /stop 08819/, last_response.body
  end

end
