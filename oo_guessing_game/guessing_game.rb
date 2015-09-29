require "pry"
require "./human_player"
require "./random_player"
require "./counting_player"
require "./smart_player"

class GuessingGame
  def initialize(player)
    @player = player
  end

  def play
    number = rand(1..100)
    result = nil
    last_guess = nil
    guess = @player.get_guess(result, last_guess)
    count = 1
    until guess == number
      if guess > number
        puts "You guessed too high."
        result = :high
        puts guess
      else
        puts "You guessed too low."
        result = :low 
        puts guess
      end
      last_guess = guess
      guess = @player.get_guess(result, last_guess)
      count += 1
    end
    puts "You win! Took #{count} tries. The number was #{number}."
  end
end

smart_player = SmartPlayer.new
game = GuessingGame.new(smart_player)

game.play