class SmartPlayer

   def get_guess(result, last_guess)
    guess = 50
    if result == :high
      guess = rand(1...last_guess)
    elsif result == :low 
      guess = rand((last_guess + 1)..100)
    end
    guess
  end

end