require "pry"
require "./player"
require "./board"
require "./game"

game = Game.new(Board.new, Player.new, Player.new)

game.play