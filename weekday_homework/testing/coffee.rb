class Coffee
  def initialize(coffee)
    @coffee = coffee
    @coffee_fullness == 3
  end

  def drink_coffee
    @coffee_fullness -= 1
  end

  def full?
    if @coffee_fullness == 3
      true
    else
      false
    end
  end

  def empty?
    if @coffee_fullness == 0
      true
    else
      false
    end
  end
end