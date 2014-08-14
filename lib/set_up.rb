require_relative 'user_interface.rb'
require_relative 'board.rb'
require_relative 'human_player.rb'
require_relative 'game.rb'
require_relative 'intel_computer_player.rb'
require_relative 'computer_player.rb'

class SetUp

  def ready
	human_player = HumanPlayer.new
	ui = UserInterface.new
	board = Board.new(ui)

	player = ui.choice

	if player == "E"
		computer_player = ComputerPlayer.new
		player = computer_player
	  ui.welcome(player)
	  player.first_move(board.cells)
	  board.computer_move(player.comp_move(player.first_move(board.cells)))
	else 
		intel_computer_player = IntelComputerPlayer.new
		player = intel_computer_player
	  ui.welcome(player)
	  player.possible_moves(board.cells) 
	  board.computer_move(player.comp_move(player.possible_moves(board.cells))) 
	end

	new_game = Game.new(player, human_player, ui, board)

  until new_game.game_over?(board.cells)
	  new_game.play_game
  end
	end
end