board = (1..9).to_a

WINNING_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], 
                        [0, 3, 6], [1, 4, 7], [2, 5, 8],
                        [0, 4, 8], [2, 4, 6]]

def show_board(board)
  puts "
     #{board[0]} | #{board[1]} | #{board[2]}
     #{board[3]} | #{board[4]} | #{board[5]}
     #{board[6]} | #{board[7]} | #{board[8]} 
     \n"
end

def choose_player
  puts "Would you like to be player 'X' or player 'O'?"
  input = gets.chomp.upcase
  until ["X", "O"].include?(input)
    puts "Please choose either 'X' or 'O' for your selection: "
    input = gets.chomp.upcase
  end
  input
end

def take_turn(board)
  show_board(board)
  puts "Please choose an available number: "
  selection = gets.chomp.to_i
  until available_moves(board).include?(selection)
    puts "#{selection} is not a valid entry. Please choose from the available numbers on the board: "
    selection = gets.chomp.to_i
  end
  selection
end

def game_over?(board)
  win_game?(board) || tie_game(board)
end

def available_moves(board)
  board.reject { |x| x.is_a? String }
end

def change_player(player)
  player = player == "X" ? "O" : "X"
end

def win_game?(board)
  WINNING_COMBINATIONS.any? do |x, y, z|
    board[x] == board[y] && board[y] == board[z]
  end
end

def tie_game(board)
  available_moves(board).all? { |x| x.is_a?(String) }
end

def end_game(board, player)
  show_board(board)
  player = change_player(player)
  if win_game?(board) 
    puts "Congratulations, Player #{player}, you've won!"
  else
    puts "No one wins! Revel in your sadness."
  end
end

def end_game_comp(board, player, computer, current_player)
  show_board(board)
  if current_player == player && win_game?(board)
    puts "Congratulations, Player #{current_player}, you've won!"
  elsif current_player == computer
    puts "Oh no, you've lost to a Pillsbury toaster strudel! Nostalgia has never tasted so caustic."
  else 
    puts "We all lose this day."
  end
end

def tic_tac_toe
  board = (1..9).to_a
  player = choose_player
  until game_over?(board)
    player_move = take_turn(board)
    board[move - 1] = player
    player = change_player(player)
  end
  end_game(board, player)
end

def comp_take_turn(board)
  show_board(board)
  choice = available_moves(board).sample
end


def tic_tac_no
board = (1..9).to_a
player = choose_player
computer = player == "X" ? "O" : "X"
  until game_over?(board)
    move = take_turn(board)
    board[move - 1] = player
    current_player = player
    unless game_over?(board)
      comp_move = comp_take_turn(board)
      board[comp_move - 1] = computer
      current_player = computer
    end
  end
    end_game_comp(board, player, computer, current_player)
end


def choose_game
  puts "\nWould you like to play with a second player or against a computer?" 
  puts "Please choose either 'Player' or 'Computer': "
  choice = gets.chomp.capitalize
  until choice == "Player" ||  choice == "Computer"
    puts "Please choose either 'Player' or 'Computer': "
    choice = gets.chomp.capitalize
  end
  if choice == "Player"
    tic_tac_toe
  else 
    tic_tac_no
  end
end


choose_game
