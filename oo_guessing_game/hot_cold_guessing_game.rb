require "pry"
require "./human_player"

class GuessingGame
  def initialize(player)
    @player = player
  end

  def play
    number = rand(1..100)
    guess = @player.get_guess
    count = 1
    until guess == number
      if (guess - number).abs.between?(50, 99)
        puts "You're so fudging cold! Guess again." 
      elsif (guess - number).abs.between?(15, 30)
        puts "Brrrr~ You're chilly, but not freezing."
      elsif (guess - number).abs.between?(5, 15)
        puts "You're getting warm!"
      elsif (guess - number).abs.between?(2, 5)
        puts "You're so hot!"
      elsif (guess - number).abs == 1
        puts "You're literally on the surface of the sun."
      end
      guess = @player.get_guess
      count += 1
    end
    puts "You win! Took #{count} tries. The number was #{number}."
  end
end

game = GuessingGame.new(HumanPlayer.new)

game.play