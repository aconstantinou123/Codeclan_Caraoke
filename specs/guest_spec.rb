require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')

class TestGuest < Minitest::Test

  def setup

    @guest = Guest.new("Jimmy")

  end

  def test_name
    assert_equal("Jimmy", @guest.name)
  end

end
