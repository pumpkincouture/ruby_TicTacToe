require_relative 'board.rb'
require_relative 'computer_player.rb'
require_relative 'human_player.rb'
require_relative'user_interface.rb'

class Game
    attr_reader :board, :computer_player, :human_player, :ui, :no_space
    
  def initialize
   @board = Board.new
   @computer_player = ComputerPlayer.new
   @human_player = HumanPlayer.new
   @ui = UserInterface.new(human_player)
  end

 
  # def game_over?(board)
  # winning_combos=[[1,2,3], [4,5,6], [7,8,9],
  #       [1,4,7], [2,5,8], [3,6,9], 
  #       [1,5,9], [3,5,7]]

  # @board.cells.each do |x|

  # end


  def game_over?(board)
  open_spaces(@board).length <=0 
  end


  def open_spaces(board)
  spaces=[]
  board.cells.each do |k, v|
  spaces << k if board.cells[k]!= "X" && board.cells[k]!="O"
  end
  spaces
  end
    
  def start
  @ui.welcome(@board)
  end 


  def play_game
  @human_player.user_turn(@ui)
  @board.human_move(@human_player.human_answer, @board, @ui)
  # self.try_again if @board.error
  if @board.error
    try_again
  else
    @computer_player.computer_turn(@board)
    @board.computer_move(@computer_player.computer_move, @ui, @board)
  end
  end

  def try_again
    until @board.error
      @human_player.user_turn(@ui) 
    end
  end

end