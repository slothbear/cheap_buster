require_relative 'test_helper'

class AppTest < MiniTest::Unit::TestCase

  def test_benton_square_02108
    VCR.use_cassette('stop_02108') do
     response = HTTParty.get(NEXTBUS, :query => {
       :command => 'predictions',
       :a => 'mbta',
       :stopId => '02108'
       })
     assert_match /Benton Square/, response.body
    end
  end

end
