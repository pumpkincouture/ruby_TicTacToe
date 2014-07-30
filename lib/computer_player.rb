require_relative 'board.rb'




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