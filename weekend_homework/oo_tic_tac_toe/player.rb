class Player

  def initialize
    puts "Would you like to be player 'X' or player 'O'?"
    input = gets.chomp.upcase
    until ["X", "O"].include?(input)
      puts "Please choose either 'X' or 'O' for your selection: "
      input = gets.chomp.upcase
    end
    @player = input
  end

  def player
    @player
  end

  def feedback
    puts "\nWould you like to play again? 'Y'es or 'N'o."
    gets.chomp.upcase
  end

  def take_turn
    puts "Please choose an available number: "
    guess = gets.chomp.to_i
    guess
  end

  # def choose_play_type
  #   puts "Would you like to play with a second player or against a computer?"
  #   puts "Please choose either 'player' or 'computer' :"
  #   options = ["player", "computer"]
  #   validate_play_type(options)
  # end

  # def validate_play_type(options)
  #   choice = gets.chomp.downcase
  #   until options.include?(choice)
  #     puts "Please choose either 'player' or 'computer': "
  #     choice = gets.chomp.downcase
  #   end
  #   choice
  # end

end
