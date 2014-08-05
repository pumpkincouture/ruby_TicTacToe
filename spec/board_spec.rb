require_relative 'spec_helper.rb'

describe Board do
	before :each do
		@board = Board.new
	end

describe "#new" do
	it "creates a new instance of Board" do
		expect(@board).to be_an_instance_of(Board)
	end

	it "instance variable should not be empty" do
		expect(@board.cells).to_not be_empty
   end

   it "instance variable should contain numbers" do
   		expect(@board.cells).to include('1', '2', '3', '4', '5', '6', '7', '8', '9')
   end

   it "instance variable should not be an array" do
   		expect(@board.cells).to_not match_array([1, 2, 3, 4, 5, 6, 7, 8, 9])
   		#a hash returns [["1", "1"], ["2", "2"], ["3", "3"], ["4", "4"], ["5", "5"], ["6", "6"], 
   		#["7", "7"], ["8", "8"], ["9", "9"]]
   end

end

describe "#invalid_key" do
	pending "takes two parameters and examines board cells" do
	@human_user=HumanPlayer.new
	@human_user.human_move = ("2")
	@board.invalid_key(@human_user.human_move, @board)
	expect(@board.invalid_key).to be true
	end
end


end
