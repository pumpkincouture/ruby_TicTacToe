require_relative 'board.rb'




class ComputerPlayer
    
  def possible_moves(board)
     @@move = []
     board.cells.each do |k,v|
     @@move << k if board.cells[k] != "X" && board.cells[k] != "O"
     end
     @@move.map!(&:to_s)
  end

  def computer_move
     @@move[-1]
  end 

end