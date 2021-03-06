require_relative 'spec_helper.rb'

describe SetUp do

	before :each do
	@setup = SetUp.new
	@ui = MockUi.new
	end

	it "creates Human Player instance" do
		expect(@setup.human_player).to eq(@setup.human_player)
	end

	it "creates User Interface instance" do
		expect(@setup.ui).to eq(@setup.ui)
	end

	it "creates Board instance" do
		expect(@setup.board).to eq(@setup.board)
	end

	pending "returns Computer Player instance" do
		human_choice = @ui.choice
		expect(@setup.choose_player).to eq("E")
	end

	pending "returns Intel Computer Player instance" do
		@setup.choose_player("H")
		expect(@setup.choose_player).to eq(@setup.player)
	end
end