require_relative 'user_interface.rb'
require_relative 'board.rb'
require_relative 'human_player.rb'
require_relative 'game.rb'
require_relative 'intel_computer_player.rb'
require_relative 'computer_player.rb'

class SetUp
	attr_reader :human_player, :ui, :board, :player

	def create_instances
	  @human_player = HumanPlayer.new
	  @ui = UserInterface.new
	  @board = Board.new(@ui)
	end

	def choose_player
	  player = @ui.choice

	  if player == "E"
		  computer_player = ComputerPlayer.new
		  @player = computer_player
	  else 
		  intel_computer_player = IntelComputerPlayer.new
		  @player = intel_computer_player
	  end
	  @player
	end
end