require "pry"
require "./player"
require "./board"
require "./game"

board = Board.new
player1 = Player.new
player2  = Player.new


game = Game.new(board, player1, player2)

binding.pry

game.play