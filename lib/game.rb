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

  @@no_space=9
     
  def decrease_space
  puts "The game has ended!" if game_over?
  @@no_space -= 1
  end
    
  def game_over?
  @@no_space <= 0
  end
    
  def welcome
  puts "Welcome to a Simpler Tic Tac Toe. The computer will go first."
  @board.board["5"]="X"
  puts "The computer chose space number 5."
  @board.display_board
  self.decrease_space
  end

  def play_game
  @human_player.user_turn(@ui)
  @board.human_move(@human_player.human_answer, @board, @ui, self)
  # self.try_again if @board.error
  if @board.error
    self.try_again
  else
    @computer_player.computer_turn(@board)
    @board.computer_move(@computer_player.computer_move, self)
  end
  end

  def try_again
    until @board.error
      @human_player.user_turn(@ui) 
    end
  end

end