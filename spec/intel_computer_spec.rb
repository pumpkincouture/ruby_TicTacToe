require_relative 'spec_helper.rb'

describe IntelComputerPlayer do

	before :each do
	  @intel_computer_player = IntelComputerPlayer.new
	end

  it "creates an instance variables" do
 	comp_winning_combos = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
 	expect(@intel_computer_player.comp_winning_combos).to eq(comp_winning_combos)
 	end


	
end