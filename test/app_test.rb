require_relative 'test_helper'
require_relative '../nextbus.rb'
require 'mail'

BENTON_SQUARE_ID = '02108'
BENTON_SQUARE = { :command => 'predictions', :a => 'mbta', :stopId => '02108' }

class AppTest < MiniTest::Unit::TestCase

  def test_shambling_skeleton
    VCR.use_cassette('benton_square') do
     response = HTTParty.get(NEXTBUS, :query => BENTON_SQUARE)
     assert_match /Benton Square/, response.body
    end
  end

  def test_benton_square_predictions
    VCR.use_cassette('benton_square') do
      assert_equal %w[11 26 41 56 71], Nextbus.predictions(BENTON_SQUARE_ID)
    end
  end

  def test_root
    get '/'
    assert last_response.ok?
    assert_match 'Cheap Buster', last_response.body
  end

  def test_post_begats_email
    post '/6175551212'
    assert last_response.ok?

    Mail.deliver do
      to 'farbot@example.com'
      from 'cheapbuster@gmail.com'
    end

    deliveries = Mail::TestMailer.deliveries
    assert_equal 1, deliveries.length
    assert_equal 'farbot@example.com', deliveries[0].to.first
  end

end
