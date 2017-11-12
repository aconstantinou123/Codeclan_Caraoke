class Guest

  attr_reader :name, :song
  attr_accessor :wallet

  def initialize(name, wallet, song)
    @wallet = wallet
    @name = name
    @song = song
  end

  def check_money(drinks, drink_name)
    for drink in drinks
        if drink_name == drink[:name] && wallet >= drink[:price]
          return true
        else
          return false
        end
      end
  end

  def check_stock(drinks, drink_name)
    for drink in drinks
      if drink_name == drink[:name] && drink[:stock] >= 1
          drink[:stock] -= 1
        return true
      end
    end
    return "Out of stock"
  end

  def buy_drink(drinks, drink_name)
    for drink in drinks
    if drink_name == drink[:name] && @wallet >= drink[:price]
      @wallet -= drink[:price]
      return @wallet
    end
      return "Customer doesn't have enough money"
    end
  end


end
