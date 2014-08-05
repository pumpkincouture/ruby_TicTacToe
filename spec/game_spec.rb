require_relative 'spec_helper.rb'


describe Game do
	before :each do
		@new_game = Game.new
	end

describe "#new" do
	it "creates a new instance of Game" do
		expect(@new_game).to be_a(Game)
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

describe "#game_over?" do
	it "keeps track of when the game is over by the amount of available spaces" do
		expect(@new_game.game_over?(@board)).to be false
	end

	pending "should return true when there are no more spaces left" do
		expect(@new_game.game_over?(@board)).to eq(@board)
	end

end

describe "#open_spaces" do

	pending "should return the number of open spaces on the board." do
		expect(@new_game.open_spaces(9)).to eq(9)
	end
	

end

describe "#welcome" do
	it "welcomes the player by inputting a string and then calls methods. Check if it calls the board with no parameters." do
		expect {subject.board (:hello) }.to raise_error
	end

end

describe "#play_game" do
	pending "calls several instances and their methods. Check if it calls the @human_player instance." do
		expect {subject.human_player.should_receive(:ui) }.and_return(subject.human_player)
	end

	pending "calls the @human_player.user_turn to determine the user's choice." do
		@new_game.human_player.user_turn(@new_game.ui).should_receive(:message).once
	end

end


end

