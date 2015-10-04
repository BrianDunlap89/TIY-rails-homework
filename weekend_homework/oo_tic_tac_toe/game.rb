
WINS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], 
        [0, 3, 6], [1, 4, 7], [2, 5, 8],
        [0, 4, 8], [2, 4, 6]]

class Game

  def initialize(board, player1, player2)
    @board = board
    @player1 = player1
    @player2 = player2
    @current_player = @player1
    @x_wins = 0
    @x_losses = 0
    @o_wins = 0
    @o_losses = 0
    @draws = 0
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
      puts "Sorry, #{guess} is not a valid option. Please choose one of the numbers still on the board: "
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

  def wld_check
    if @board.tie_game
      @draws += 1
    elsif @board.win_game && @current_player.player == "X"
      @x_wins += 1
      @o_losses += 1
    elsif @board.win_game && @current_player.player == "O"
      @x_losses += 1
      @o_wins += 1
    end
  end

  def display_wld
    puts "X Wins: #{@x_wins}"
    puts "X Losses: #{@x_losses}"
    puts "O Wins: #{@o_wins}"
    puts "O Losses: #{@o_losses}"
    puts "Draws: #{@draws}"
  end

  def end_game
    @current_player = @current_player == @player1 ? @player2 : @player1
    wld_check
    @board.show_board
    if @board.win_game 
      puts "Congratulations, Player #{@current_player.player}, you've won!"
    else
      puts "No one wins!"
    end
    display_wld
  end

  def reset_board
    @board = Board.new
  end

  def play_again?
    choices = ["Y", "N"]
    puts "\nWould you like to play again? Please pick 'Y'es or 'N'o: "
    response = gets.chomp.upcase
    until response == "N"
      reset_board
      play
      puts "\nWould you like to play again? Please pick 'Y'es or 'N'o: "
      response = gets.chomp.upcase
    end
    puts "\nGoodbye!"
  end

  def play
    greeting
    turn_cycle
    end_game
    play_again?
  end

end

