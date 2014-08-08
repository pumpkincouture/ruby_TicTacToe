require './lib/game'
require './lib/board'
require './lib/computer_player'
require './lib/human_player'
require './lib/user_interface'
require './lib/intel_computer_player'

human_player = HumanPlayer.new
ui = UserInterface.new
computer_player = ComputerPlayer.new
intel_computer_player = IntelComputerPlayer.new
board = Board.new(ui)

new_game = Game.new(computer_player, human_player, ui, board)

player = ui.choice

if player == "E"
	player = computer_player
else 
	player = intel_computer_player
end

ui.welcome(board.cells, player)

until new_game.game_over?(board.cells)
  human_player.user_turn(ui)
  if board.invalid_key(human_player.answer, board.cells)
    ui.user_error
  else
    board.valid_move(human_player.answer, board.cells)
    player.possible_moves(board.cells) 
    board.computer_move(player.computer_move(player.possible_moves(board.cells)), board.cells)
	end
end
