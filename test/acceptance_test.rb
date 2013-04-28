require_relative 'test_helper'

class AcceptanceTest < MiniTest::Unit::TestCase

  def test_get_form
    visit '/'
    fill_in 'phone', with: '6172020202'
    fill_in 'email', with: 'sam@example.com'
    fill_in 'stops', with: '02108'
    click_button 'add my stops'

    assert_match 'stop added', last_response.body
  end

end