require_relative 'board.rb'

class ComputerPlayer
    
  def first_move(cells)
  values = cells.values
  values[rand(values.size)]
  end
  
  def possible_moves(cells)
    move = []
    cells.each do |k,v|
    move << k if cells[k] != "X" && cells[k] != "O"
    end
    move.map!(&:to_s)
  end

  def comp_move(move)
    move[-1]
  end 
end