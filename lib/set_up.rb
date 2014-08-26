require_relative 'user_interface.rb'
require_relative 'board.rb'
require_relative 'human_player.rb'
require_relative 'game.rb'
require_relative 'intel_computer_player.rb'
require_relative 'computer_player.rb'

class SetUp
	attr_reader :player, :human_player, :ui, :board

	def create_instances
	  @human_player = HumanPlayer.new
	  @ui = UserInterface.new
	  @board = Board.new(@ui)
	end

	def choose_player

		human_choice = @ui.choice

	  if human_choice == "E"
		  @player = ComputerPlayer.new
	  else 
		  @player = IntelComputerPlayer.new
	  end
	  @player
	end
end