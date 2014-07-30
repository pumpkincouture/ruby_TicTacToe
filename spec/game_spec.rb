require_relative 'spec_helper.rb'


describe Game do
	before :each do
		@new_game=Game.new
	end

describe "#new" do
	it "creates a new instance of Game" do
		expect(@new_game).to be_an_instance_of(Game)
	end

	it "should recognize that a new instance of Board was created" do
	# assigns(:board).should be_kind_of(Board)
	expect(@new_game.board).to be_a(Board)
	end

	it "should recognize that a new instance of Computer Player was created" do
	expect(@new_game.computer_player).to be_a(ComputerPlayer)
	end

	it "should recognize that a new instance of Human Player was created" do
	expect(@new_game.human_player).to be_a(HumanPlayer)
	end

	it "should recognize that a new instance of User Interface was created" do
	expect(@new_game.ui).to be_a(UserInterface)
	end

end

describe "#decrease_space" do

	# before :each do
	# 	expect{subject}.to change{@new_game.decrease_space}.by(-1)
	# end

	it "should start the game with 8 spaces since computer goes first." do
		expect(@new_game.decrease_space).to eq(8)
	end


	it "should decrease @@no_space by 1" do
	expect{subject}.to change{@new_game.decrease_space}.by(-1)
	end

end

describe "#game_over?" do
	it "keeps track of when @@no_space becomes zero, then stops the game. Should return false at the start of the game." do
		expect(@new_game.game_over?).to be false
	end

end

describe "#welcome" do
	it "welcomes the player by inputting a string and then calls methods. Check if it calls the board with no parameters." do
		expect {subject.board (:hello) }.to raise_error
	end

	it "checks if it calls the board method." do
		#fill in later
	end

end

describe "#play_game" do
	it "calls several instances and their methods. Check if it calls the @human_player instance." do
		expect {subject.human_player.should_receive(:ui) }.and_return(subject.human_player)
	end
	#this will produce a failure

	# it "calls the @human_player.user_turn to determine the user's choice." do
	# 	@new_game.human_player.user_turn(@new_game.ui).should_receive(:message).once
	# end

end


end

