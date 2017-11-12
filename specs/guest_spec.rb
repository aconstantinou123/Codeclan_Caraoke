require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')

class TestGuest < Minitest::Test

  def setup

    @guest = Guest.new("Jimmy", 20, 'Master of Puppets')

    @drinks = [
			{
				name: "Vodka",
				price: 4.50,
        alcohol: 40,
        stock: 5
			},
			{
        name: "Beer",
				price: 5.00,
        alcohol: 10,
        stock: 5
			},
      {
        name: "Wine",
        price: 7.50,
        alcohol: 15,
        stock: 0
      }
    ]

  end

  def test_name
    assert_equal("Jimmy", @guest.name)
  end

  def test_customer_has_enough_money
    assert_equal(true, @guest.check_money(@drinks,"Vodka"))
  end

  def test_buy_drink
    assert_equal(15.50, @guest.buy_drink(@drinks, "Vodka"))
  end

  def test_check_stock_out_of_stock
    @guest.check_stock(@drinks, "Wine")
    assert_equal("Out of stock", @guest.check_stock(@drinks, "Wine"))
  end

  def test_check_stock_success
    @guest.check_stock(@drinks, "Vodka")
    assert_equal(true, @guest.check_stock(@drinks, "Vodka"))
  end

end
