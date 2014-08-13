require_relative 'spec_helper.rb'

describe Game do
	let(:cells) { {"1" => "X", "2" => "X", "3" => "X", "4" => "O", "5" => "O", "6" => "6", "7" => "O", "8" => "8", "9" => "9"} }
	let(:computer_spaces) { ["1", "2", "3"] }
	let(:human_spaces) { ["4", "5", "7"] }
	let(:open_spaces) { ["6", "8", "9"] }

	before :each do
		@user_interface = MockUi.new
		@new_game = Game.new(@computer_player, @human_player, @user_interface, @board)
	end

	it "returns an array of the computer's current spaces" do
	  expect(@new_game.computer_spaces(cells)).to eq(computer_spaces)
	end

	it "returns an array of the human user's current spaces" do
		expect(@new_game.human_spaces(cells)).to eq(human_spaces)
	end

	it "given the board state, it returns a winner" do
	  expect(@new_game.winner?(computer_spaces, human_spaces)).to be true
	end

	it "keeps track of which spaces are currently unoccupied" do
	  expect(@new_game.open_spaces(cells)).to eq(open_spaces)
	end

	it "returns true if the game is over or if there are no spaces left" do
		expect(@new_game.game_over?(cells)).to be true
	end
end

