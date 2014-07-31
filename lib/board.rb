require_relative 'game.rb'
require_relative 'user_interface.rb'



class Board
    attr_reader :cells, :error

     def initialize
    @cells={"1"=>"1", "2"=>"2", "3"=>"3", "4"=>"4", "5"=>"5", 
     "6"=>"6", "7"=>"7", "8"=>"8", "9"=>"9"}
     end

   def invalid_key(answer, board)
     board.cells[answer] !~ /\d+/
   end

   def invalid_move(answer, board)
     board.cells[answer].include? "X" || "O" 
   end

   def valid_move(answer, board)
     invalid_move(answer, board) ||  invalid_key(answer, board)
   end

   def human_move(answer, board, ui)

        if invalid_key(answer,board)
        ui.user_error
        @error=true
        elsif invalid_move(answer,board)
        ui.user_error
        @error=true
        else
        @error=false
        board.cells[answer]="O"
        valid_move(answer,board)
        ui.choice
        ui.display_board(board.cells)
        end
    end
    
    def computer_move(answer, ui, board)
        @cells[answer]="X"
        puts "Computer chose space number #{answer}."
        ui.display_board(board.cells)
        
    end

end