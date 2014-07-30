# require_relative 'game.rb'
# require_relative 'user_interface.rb'
require_relative 'test2.rb'
#require doesn't work

# puts "Hello"

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