require_relative 'spec_helper.rb'

describe SetUp do

	before :each do
	@setup = SetUp.new
	end

	pending "sets up the instance variables the game will use" do
		choice =  "E" 
		expect(@setup.choice).to eq(choice)
	end	
end