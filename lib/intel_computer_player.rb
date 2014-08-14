require_relative 'board.rb'

class IntelComputerPlayer

  def initialize
    @winning_combos = [[1,2,3], [4,5,6], [7,8,9],
                      [1,4,7], [2,5,8], [3,6,9], 
                      [1,5,9], [3,5,7]]
  end

  def comp_location(cells)
    computer_spaces = []

    cells.each do |k,v|
      if cells[k] == "X"
        computer_spaces << k
      else
        false
      end
    end
    computer_spaces
  end 

  def human_location(cells)
    human_spaces = []

    cells.each do |k,v|
      if cells[k] == "O"
        human_spaces << k
      else
        false
      end
    end
    human_spaces
  end

  def smart_move(cells)
    comp_spaces = comp_location(cells)

    comp_spaces.map!(&:to_i)

    # p optimal_comp
    options = []

    if comp_spaces.empty?
    else
      @winning_combos.each do |sub_array|
        intersect = sub_array & comp_spaces
        if intersect.any?
          difference = sub_array - comp_spaces
          options << difference
          # elsif sub_array.include? block
        #   puts sub_array
        #   return true
        end
      end
    end
    options.uniq!
    options
  end

  
  def valid_computer_move(cells)
    smart = smart_move(cells)
    human_spaces = human_location(cells)

    human_spaces.map!(&:to_i)

    smart.each do |sub_array|
      intersect = sub_array & human_spaces
      if sub_array.any?
        sub_array.delete(intersect[-1])
      end
    end
    smart
  end


  def block_move(cells)
    human_spaces = human_location(cells)

    human_spaces.map!(&:to_i)

    to_block = []

    @winning_combos.each do |sub_array|
      intersect = sub_array & human_spaces
      if intersect.any?
        difference = sub_array - human_spaces
        to_block << difference
      end
    end

    to_block.uniq!
    to_block
  end

  def to_block?(cells)
    block_this = block_move(cells)

  to_block.each do |sub_array|
      if sub_array.length == 1
          return sub_array
      else
        false
      end
    end
  end

  def possible_moves(cells)

    valid = valid_computer_move(cells)
    block_this = block_move(cells)

    p valid

    p block_this



    # smart.each do |sub_array|
    #   if cells[]

    if valid == false
      puts "Is false"
      move = ["6", "7"]
    else
      move = []
      cells.each do |k,v|
        move << k if cells[k] != "X" && cells[k] != "O"
      end
      move.map!(&:to_s)
    end
  end

  def comp_move(move)
  	if move.include? "5"
  		return "5"
  	else
      return move[-1]
  	end
  end 
end
