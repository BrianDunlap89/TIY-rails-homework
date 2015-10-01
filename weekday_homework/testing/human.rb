class Human
  def initialize(name)
    @name = name
    @alertness = 0.01
  end

  def alertness
    @alertness
  end

  def buy(coffee)
    @coffee = coffee
  end

  def drink!
    drink_coffee
    @alertness += 0.3
  end

  def has_coffee?
    false
  end

  def needs_coffee?
    true
  end

end