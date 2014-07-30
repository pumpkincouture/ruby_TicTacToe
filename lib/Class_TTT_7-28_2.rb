class Game
    attr_reader :board, :computer_player, :human_player, :ui
    
  def initialize
   @board = Board.new
   @computer_player = ComputerPlayer.new
   @human_player = HumanPlayer.new
   @ui = UserInterface.new(human_player)
   # (human_player) Should be above
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

class Board
    attr_reader :board, :error

     def initialize
    @board={"1"=>"1", "2"=>"2", "3"=>"3", "4"=>"4", "5"=>"5", 
     "6"=>"6", "7"=>"7", "8"=>"8", "9"=>"9"}
     end

   def invalid_key(answer, board)
     self.board[answer] !~ /\d+/
   end

   def invalid_move(answer, board)
     self.board[answer].include? "X" || "O" 
   end

   def valid_move(answer, board)
     if self.invalid_move(answer, board) ||  self.invalid_key(answer, board)
        return false
      else
        return true
      end 
   end

   def human_move(answer, board, ui, new_game)

        if self.invalid_key(answer,board)
        ui.user_error
        @error=true
        elsif self.invalid_move(answer,board)
        ui.user_error
        @error=true
        else
        @error=false
        board.board[answer]="O"
        self.valid_move(answer,board)
        ui.choice
        self.display_board
        new_game.decrease_space
        end
    end
    
    def computer_move(answer, new_game)
        @board[answer]="X"
        puts "Computer chose space number #{answer}"
        self.display_board
        new_game.decrease_space
        
    end
      
    def display_board
    puts "#{@board["1"]} | #{@board["2"]} | #{@board["3"]}"
    puts "---------"
    puts "#{@board["4"]} | #{@board["5"]} | #{@board["6"]}"
    puts "---------"
    puts "#{@board["7"]} | #{@board["8"]} | #{@board["9"]}"
    end    
    
end

  class UserInterface

      
      def initialize(human_player)
      @human_player=human_player
      end

    def user_prompt
    puts "Please choose a number for your 'O'."
    end
    
    def choice
    puts "You chose space number #{@human_player.human_answer}."
    end
    
    def user_error
    puts "I'm sorry, that is not a valid move, please try again."
    end
   
  end


class ComputerPlayer
    
    attr_reader :computer_move
    
    def initialize
    @computer_move=computer_move
  end
   
  def computer_turn(board)
        move=[]
        board.board.each do |k, v|
        move << k if board.board[k]!= "X" && board.board[k]!="O"
        end
        move.map!(&:to_s)
        @computer_move=move[-1]
    end
end


class HumanPlayer
    attr_reader :human_answer
    
    def initialize
    @human_answer=human_answer
    end

 def user_turn(ui)
    ui.user_prompt
    @human_answer=gets.chomp
    end

end


new_game= Game.new
new_game.welcome


until new_game.game_over?
new_game.play_game
end




















