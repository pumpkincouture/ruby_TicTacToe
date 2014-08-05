require_relative 'game.rb'
require_relative 'user_interface.rb'



class Board
    attr_reader :cells, :error

    def initialize(user_interface)
    @ui = user_interface
    @cells = {"1" => "1", "2" => "2", "3" => "3", "4" => "4", "5" => "5", 
     "6" => "6", "7" => "7", "8" => "8", "9" => "9"}
     end

   def invalid_key(answer, board)
     cells[answer] !~ /\d+/
   end


   def invalid_move(answer, board)
     cells[answer].include? "X" || "O"
   end


   def valid_move(answer, board)
     board.cells[answer] = "O"
     @ui.human_choice(answer)
     @ui.display_board(board.cells)
   end


  def computer_move(answer, board)

        @cells[answer] = "X"
        @ui.computer_choice(answer)
        @ui.display_board(board.cells)
        
  end

end