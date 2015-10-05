class Board

  attr_reader :board

  def initialize
    @board = (1..9).to_a
  end

  def update_board(guess, mark)
    @board[guess - 1] = mark
  end

  def show_board
    puts "
     #{@board[0]} | #{@board[1]} | #{@board[2]}
     #{@board[3]} | #{@board[4]} | #{@board[5]}
     #{@board[6]} | #{@board[7]} | #{@board[8]} 
     \n"
  end

  def available_moves
    @board.reject { |x| x.is_a? String }
  end

  def win_game
    WINS.any? do |x, y, z|
      @board[x] == @board[y] && @board[y] == @board[z]
    end
  end

  def tie_game
    @board.all? { |x| x.is_a?(String) }
  end

  def game_over?
    win_game || tie_game
  end  

end
