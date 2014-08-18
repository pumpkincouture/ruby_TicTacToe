require_relative 'board.rb'
require_relative 'computer_player.rb'
require_relative 'human_player.rb'
require_relative 'user_interface.rb'
require_relative 'ttt_constants.rb'


class Game
  include TTTConstants

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
      if cells[k] == X_PIECE
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
      if cells[k] == O_PIECE
        human_spaces << k
      else
        false
      end
    end
    human_spaces
  end

  def winner?(computer_spaces, human_spaces)

    computer_spaces.map!(&:to_i)
    human_spaces.map!(&:to_i) 

    WINNING_COMBOS.each do |sub_array|
      if sub_array.all? {|x|computer_spaces.include?(x)}
        return "computer"
      elsif sub_array.all? {|y|human_spaces.include?(y)}
        return "human"
      end
    end
    return false
  end

  def end_game_message(winning_player)
    @ui.computer_wins if winning_player == "computer"
    @ui.human_wins if winning_player == "human" 
    @ui.cats_game if winning_player == false
  end

  def open_spaces(cells)
    spaces = []
    cells.each do |k, v|
    spaces << k if cells[k] != X_PIECE && cells[k] != O_PIECE
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