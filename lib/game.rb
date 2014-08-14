require_relative 'board.rb'
require_relative 'computer_player.rb'
require_relative 'human_player.rb'
require_relative 'user_interface.rb'

class Game
  attr_reader :player, :human_player, :ui, :board
    
  def initialize(player, human_player, user_interface, board)
    @player = player
    @human_player = human_player
    @ui = user_interface
    @board = board
  end

  def computer_spaces(cells)
    computer_spaces = []

    cells.each do |k,v|
      if cells[k] == "X"
        computer_spaces << k
      else
        false
      end
    end
    computer_spaces
  end

  def human_spaces(cells)
    human_spaces = []

    cells.each do |k,v|
      if cells[k] == "O"
        human_spaces << k
      else
        false
      end
    end
    human_spaces
  end

  def winner?(computer_spaces, human_spaces)
    winning_combos = [[1,2,3], [4,5,6], [7,8,9],
                      [1,4,7], [2,5,8], [3,6,9], 
                      [1,5,9], [3,5,7]]

    computer_spaces.map!(&:to_i)
    human_spaces.map!(&:to_i) 

    winning_combos.each do |sub_array|
      if sub_array.all? {|x|computer_spaces.include?(x)}
        @ui.computer_wins
        return true
      elsif sub_array.all? {|y|human_spaces.include?(y)}
        @ui.human_wins
        return true
      end
    end
      return false
  end

  def open_spaces(cells)
    spaces = []
    cells.each do |k, v|
    spaces << k if cells[k] != "X" && cells[k] != "O"
    end
    spaces
  end

  def game_over?(cells)
    winner?(computer_spaces(cells), human_spaces(cells)) || open_spaces(cells).length <= 0 
  end

  def play_game
    @human_player.user_turn(@ui)
    if @board.invalid_key(@human_player.answer)
      @ui.user_error
    else
      @board.valid_move(@human_player.answer)
      @board.computer_move(@player.comp_move(@player.possible_moves(@board.cells))) 
    end
  end
end