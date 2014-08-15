require_relative 'spec_helper.rb'

describe IntelComputerPlayer do

	before :each do
	  @intel_computer_player = IntelComputerPlayer.new
	end

  it "creates an instance variables" do
 	  comp_winning_combos = [ [1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7] ]
 	  expect(@intel_computer_player.comp_winning_combos).to eq(comp_winning_combos)
 	end
	
	it "returns an array of the computer's location on the board" do
	  cells_example = {"1" => "1", "2" => "2", "3" => "3", "4" => "4", "5" => "X", "6" => "O", "7" => "X", "8" => "8", "9" => "9"}
	  computer_location = ["5", "7"]
	  expect(@intel_computer_player.comp_location(cells_example)).to eq(computer_location)
	end

	it "returns an array of the human's location on the board" do
	  cells_example = {"1" => "1", "2" => "O", "3" => "O", "4" => "4", "5" => "X", "6" => "O", "7" => "X", "8" => "8", "9" => "9"}
	  human_location = ["2", "3", "6"]
	  expect(@intel_computer_player.human_location(cells_example)).to eq(human_location)
	end

	it "takes the human move on the board and checks if it appears in comp winning moves. If it does, the entire array is deleted." do
	  cells_example = {"1" => "1", "2" => "O", "3" => "O", "4" => "4", "5" => "X", "6" => "6", "7" => "X", "8" => "8", "9" => "9"}
	  comp_winning_moves = [ [], [4,5,6], [7,8,9], [1,4,7], [], [], [1,5,9], [] ]
	  expect(@intel_computer_player.delete_from_array(cells_example)).to eq(comp_winning_moves)
	end

	it "checks if the comp moves on the board intersect with comp winning moves. If comp_move is empty, it returns 5 as first move." do
		cells_example = {"1" => "1", "2" => "O", "3" => "O", "4" => "4", "5" => "5", "6" => "6", "7" => "7", "8" => "8", "9" => "9"}
		expect(@intel_computer_player.smart_move(cells_example)).to eq([5])
	end

	it "checks if the comp moves on the board intersect with comp winning moves. Should return an array of potential winning moves." do
		cells_example = {"1" => "1", "2" => "2", "3" => "3", "4" => "4", "5" => "X", "6" => "6", "7" => "7", "8" => "8", "9" => "9"}
		comp_winning_combos = [ [1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7] ]
		options = [ [4,6], [2,8], [1,9], [3,7] ]
		expect(@intel_computer_player.smart_move(cells_example)).to eq(options)
	end

	it "changes sub array of winning moves to one array. If no moves on board continues through by choosing 5." do
		cells_example = {"1" => "1", "2" => "O", "3" => "O", "4" => "4", "5" => "5", "6" => "6", "7" => "7", "8" => "8", "9" => "9"}
		smart = [5]
		expect(@intel_computer_player.win_move(cells_example)).to eq(smart)
	end	

	it "changes sub array of winning moves to on array. Deletes any duplicates." do
		cells_example = {"1" => "1", "2" => "2", "3" => "2", "4" => "4", "5" => "X", "6" => "6", "7" => "7", "8" => "8", "9" => "9"}
		smart = [ [4,6], [2,8], [1,9], [3,7] ]
		winning_numbers = [4, 6, 2, 8, 1, 9, 3, 7]
		expect(@intel_computer_player.win_move(cells_example)).to eq(winning_numbers)
	end

	it "checks human win combos with human spaces to see if human is near a win. Deletes human location values and returns array with all possible blocks." do
		cells_example = {"1" => "1", "2" => "O", "3" => "3", "4" => "4", "5" => "X", "6" => "6", "7" => "7", "8" => "8", "9" => "9"}
		options = [ [1,3], [5,8] ]
		expect(@intel_computer_player.find_block_move(cells_example)).to eq(options)
	end	

	it "only passes if there is one more possible move to human to make from find_block_move method. Otherwise evaluates to false." do
		cells_example = {"1" => "O", "2" => "O", "3" => "3", "4" => "4", "5" => "X", "6" => "6", "7" => "7", "8" => "8", "9" => "9"}
		block = [[3]]
		expect(@intel_computer_player.refine_block_move(cells_example)).to eq(block)
	end	

	it "takes the nested array from refine_block_move and extracts it into an integer in an array, then turns it into a string" do
		cells_example = {"1" => "O", "2" => "O", "3" => "3", "4" => "4", "5" => "X", "6" => "6", "7" => "7", "8" => "8", "9" => "9"}
		block = ["3"]
		expect(@intel_computer_player.string_block(cells_example)).to eq(block)
	end

	it "performs the final check on block. If the computer already made the block, it fails. " do
		cells_example = {"1" => "O", "2" => "O", "3" => "X", "4" => "4", "5" => "X", "6" => "6", "7" => "7", "8" => "8", "9" => "9"}
		option = ["3"]
		expect(@intel_computer_player.to_block?(cells_example)).to be false
	end

	it "performs the final check on block array. If the computer has not made the block yet, it passes and returns the block array." do
		cells_example = {"1" => "O", "2" => "O", "3" => "3", "4" => "4", "5" => "X", "6" => "6", "7" => "7", "8" => "8", "9" => "9"}
		option = ["3"]
		expect(@intel_computer_player.to_block?(cells_example)).to eq(option)
	end

	it "if the computer cannot win or block, it chooses a random move." do
		cells_example = {"1" => "O", "2" => "O", "3" => "X", "4" => "O", "5" => "X", "6" => "O", "7" => "7", "8" => "O", "9" => "X"}
		last_move = ["7"]
		expect(@intel_computer_player.moves_left(cells_example)).to eq(last_move)
	end

	it "evaluates all possibilities-winning move, block, or random move and places it. Returns an array of winning possibilities." do
		cells_example = {"1" => "X", "2" => "2", "3" => "3", "4" => "O", "5" => "X", "6" => "6", "7" => "O", "8" => "8", "9" => "9"}
		win = ["2", "3", "8", "9"]
		expect(@intel_computer_player.possible_moves(cells_example)).to eq(win)
	end

	it "evaluates all possibilities-winning move, block, or random move and places it. Returns a block array." do
		cells_example = {"1" => "O", "2" => "O", "3" => "3", "4" => "4", "5" => "X", "6" => "6", "7" => "O", "8" => "8", "9" => "X"}
		win = ["3"]
		expect(@intel_computer_player.possible_moves(cells_example)).to eq(win)
	end

	it "evaluates all possibilities-winning move, block, or random move and places it. Returns a random array." do
		cells_example = {"1" => "O", "2" => "O", "3" => "X", "4" => "O", "5" => "X", "6" => "O", "7" => "7", "8" => "O", "9" => "X"}
		random = ["7"]
		expect(@intel_computer_player.possible_moves(cells_example)).to eq(random)
	end

	it "returns the string the computer chooses." do
		cells_example = {"1" => "O", "2" => "O", "3" => "X", "4" => "O", "5" => "X", "6" => "O", "7" => "7", "8" => "O", "9" => "X"}
		result = "7"
		expect(@intel_computer_player.comp_move(result)).to eq(result)
	end
end