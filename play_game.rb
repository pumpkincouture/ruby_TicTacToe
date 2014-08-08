require './lib/game'
require './lib/board'
require './lib/computer_player'
require './lib/human_player'
require './lib/user_interface'

computer_player = ComputerPlayer.new
human_player = HumanPlayer.new
ui = UserInterface.new
board = Board.new(ui)

new_game = Game.new(computer_player, human_player, ui, board)

ui.welcome(board.cells)

until new_game.game_over?(board.cells)
  human_player.user_turn(ui)
  if board.invalid_key(human_player.answer, board.cells)
    ui.user_error
  else
    board.valid_move(human_player.answer, board.cells)
    computer_player.possible_moves(board.cells) 
    board.computer_move(computer_player.computer_move(computer_player.possible_moves(board.cells)), board.cells)
	end
end