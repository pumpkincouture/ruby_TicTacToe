require_relative 'spec_helper.rb'

describe Board do
  let (:cells_instance) { {"1" => "1", "2" => "2", "3" => "3", "4" => "4", "5" => "5", "6" => "6", "7" => "7", "8" => "8", "9" => "9"} }
  let (:cells_example) { {"1" => "X", "2" => "X", "3" => "X", "4" => "O", "5" => "X", "6" => "6", "7" => "O", "8" => "8", "9" => "X"} }
  let (:computer_answer) { "9" }
  let (:human_answer) { "6" }
  let (:invalid_answer) { " " }
  let (:ui_human_choice) {"You chose number 5"}

  before :each do
    @board = Board.new(@ui)
  end

	it "creates a cells instance variable" do
	  expect(@board.cells).to eq(cells_instance)
	end

	it "instance variable should contain numbers" do
	  expect(@board.cells).to include('1', '2', '3', '4', '5', '6', '7', '8', '9')
	end

	it "instance variable should not be an array" do
	  expect(@board.cells).to_not match_array([1, 2, 3, 4, 5, 6, 7, 8, 9])
	end

	it "if answer is an invalid key, the hash should be checked and return true" do
		expect(@board.invalid_key(invalid_answer, cells_example)).to be true
	end

	pending "if the answer is valid, the move is placed on the board" do
	  expect(@board.valid_move(human_answer, cells_example)).to eq(cells_example)
	end

	pending "computer answer gets placed on the board" do
		expect(@board.computer_move(computer_answer, cells_example)).to eq(cells_example)
	end
end

