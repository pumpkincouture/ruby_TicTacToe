require_relative 'board.rb'

class IntelComputerPlayer


def possible_moves(cells)
    move = []
    cells.each do |k,v|
    move << k if cells[k] != "X" && cells[k] != "O"
    end
    move.map!(&:to_s)
  end

  def comp_move(move)
  	if move.include? "5"
  		return "5"
  	else
    return move[-1]
  	end
  end 
end
