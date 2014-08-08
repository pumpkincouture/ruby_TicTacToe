require_relative 'spec_helper.rb'

describe HumanPlayer do
  let(:human_move) { ["5"] }
  let(:ui) { ["Please choose a move"] }

  before :each do
    @human_player = HumanPlayer.new
  end
	
	pending "allows the player to choose a move" do
		expect(@human_player.user_turn(ui)).to raise_error
	end

	pending "returns the human move" do
		expect(@human_player.answer).to eq(human_move)
	end
end