require "pry"
require "./human_player"

class GuessingGame
  def initialize(player)
    @player = player
  end

  def play
    number = rand(1..100)
    result = nil
    last_guess = nil
    guess = @player.get_guess
    count = 1
    until guess == number
      if (guess - number).abs > 50
        puts "You're cold as shit! Guess again." 
      elsif  (guess - number).abs.between?(15, 30)
        puts "You're cool, but getting slighly warmer."
      elsif (guess - number).abs.between?(5, 15)
        puts "You're getting warm!"
      elsif (guess - number).abs.between?(1, 5)
        puts "You're so hot!"
      end
      guess = @player.get_guess
      count += 1
    end
    puts "You win! Took #{count} tries. The number was #{number}."
  end
end

game = GuessingGame.new(HumanPlayer.new)

game.play