require_relative 'test_helper'

BENTON_SQUARE = { :command => 'predictions', :a => 'mbta', :stopId => '02108' }

class AppTest < MiniTest::Unit::TestCase

  def test_shambling_skeleton
    VCR.use_cassette('benton_square') do
     response = HTTParty.get(NEXTBUS, :query => BENTON_SQUARE)
     assert_match /Benton Square/, response.body
    end
  end

end
