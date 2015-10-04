require "pry"
require "./board"
require "./game"
require "./player"

require 'minitest/autorun'

class TicTacToeTest < MiniTest::Test

  def test_verify_turn_cycle
    game = Game.new(Board.new, Player.new, Player.new)
    assert_equal @player1, @current_player
    game.turn_cycle
    assert_equal @player2, @current_player
  end

  def test_verify_board_update
    board = Board.new
    board.update_board(3, "X")
    assert_equal(board.board[2], "X")
  end

  def test_verify_tie_game
    board = Board.new
    board.board.map! do |x| 
      x = "X"
    end
    assert board.tie_game
  end

  def test_verify_game_win
    board = Board.new
    board.board.map! do |x, y, z|
      x = "X"
      y = "X"
      z = "X"
    end
    assert board.win_game
  end

  def test_new_player
    assert Player.new
  end

  def test_verify_game_over
    board = Board.new
    board.board.map! do |x| 
      x = "X"
    end
    assert board.game_over?
    board.board.map! do |x, y, z|
      x = "X"
      y = "X"
      z = "X"
    end
    assert board.game_over?
  end

end