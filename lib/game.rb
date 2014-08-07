require_relative 'board.rb'
require_relative 'computer_player.rb'
require_relative 'human_player.rb'
require_relative 'user_interface.rb'

class Game
  attr_reader :computer_player, :human_player, :ui, :board
    
  def initialize(computer_player, human_player, user_interface, board)
    @computer_player = computer_player
    @human_player = human_player
    @ui = user_interface
    @board = board
  end

  def taken_spaces
    @@human_spaces = []
    @@computer_spaces = []

    @board.cells.each do |k,v|
      if @board.cells[k] == "X"
      @@computer_spaces << k
      elsif @board.cells[k] == "O"
      @@human_spaces << k
      else
      false
      end
    end
  @@human_spaces
  @@computer_spaces
  end

  def winner?(spaces)
    winning_combos = [[1,2,3], [4,5,6], [7,8,9],
    [1,4,7], [2,5,8], [3,6,9], 
    [1,5,9], [3,5,7]]

    @@human_spaces.map!(&:to_i)
    @@computer_spaces.map!(&:to_i)   

    winning_combos.each do |sub_array|
      if sub_array.all? {|x|@@human_spaces.include?(x)}
      ui.human_wins
      return true
      elsif sub_array.all? {|y|@@computer_spaces.include?(y)}
      ui.computer_wins
      return true
      end
    end
      return false
  end

  def open_spaces
    spaces = []
    @board.cells.each do |k, v|
    spaces << k if @board.cells[k] != "X" && @board.cells[k] != "O"
    end
    spaces
  end

  def game_over?
    winner?(taken_spaces) || open_spaces.length <= 0 
  end

  def start
    @ui.welcome(@board.cells)
  end 

  def play_game
    @human_player.user_turn(@ui)
      if @board.invalid_key(@human_player.answer, @board.cells)
      @ui.user_error
      else
      @board.valid_move(@human_player.answer, @board.cells)
      @computer_player.possible_moves(@board) 
      @board.computer_move(@computer_player.computer_move, @board.cells)
      end
  end
end