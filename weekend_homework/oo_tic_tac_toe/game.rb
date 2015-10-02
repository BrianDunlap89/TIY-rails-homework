require 'pry'

WINS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], 
        [0, 3, 6], [1, 4, 7], [2, 5, 8],
        [0, 4, 8], [2, 4, 6]]

class Game

  def initialize(board, player1, player2)
    @board = board
    @player1 = player1
    @player2 = player2
    @current_player = @player1
  end

  def greeting
    puts "Welcome to Tic Tac Toe!"
  end

  def player_turn
    @board.show_board
    mark = @current_player.player
    guess = @current_player.take_turn
    available_moves = @board.available_moves
    until available_moves.include?(guess)
      puts "#Sorry, {guess} is not a valid option. Please choose one of the numbers still on the board: "
      guess = gets.chomp.to_i
    end
    @board.update_board(guess, mark)
  end

  def turn_cycle
    until @board.game_over?
      player_turn
      @current_player = @current_player == @player1 ? @player2 : @player1
    end
  end

  def end_game
    @board.show_board
    if @board.win_game 
      puts "Congratulations, Player #{@current_player.player}, you've won!"
    else
      puts "No one wins!"
    end
  end

  def play
    greeting
    turn_cycle
    end_game
    play_again?
  end

def play_again?
    response = @current_player.feedback
    until response == "N" 
      play
      response = feedback
    end 
    puts "\nGoodbye!"
  end

end
