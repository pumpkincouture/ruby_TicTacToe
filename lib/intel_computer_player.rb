require_relative 'board.rb'

class IntelComputerPlayer

  def initialize
    @comp_winning_combos = [[1,2,3], [4,5,6], [7,8,9],
                           [1,4,7], [2,5,8], [3,6,9], 
                           [1,5,9], [3,5,7]]

    @human_winning_combos = [[1,2,3], [4,5,6], [7,8,9],
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

  def delete_from_array(cells)
    human_spaces = human_location(cells)

    human_spaces.map!(&:to_i)

    @comp_winning_combos.each do |sub_array|
      intersect = sub_array & human_spaces
      if intersect.any?
        difference = sub_array - human_spaces
        sub_array.clear
      end
    end
  end

  def smart_move(cells)
    comp_spaces = comp_location(cells)
    wins_left = delete_from_array(cells)

    comp_spaces.map!(&:to_i)

    options = []

    if comp_spaces.empty?
      return [5]
    else
      @comp_winning_combos.each do |sub_array|
        intersect = sub_array & comp_spaces
        if intersect.any?
          difference = sub_array - comp_spaces
          options << difference
        end
      end
    end
    options.uniq!
    options
  end

  def win_move(cells)
    # valid_move = valid_computer_move(cells)
    smart = smart_move(cells)

    # p valid_move
    # p smart
    # puts "smart options in win_move"

    winning_numbers = []
    if smart.include? 5
      return smart
    else
      smart.each do |sub_array|
        sub_array.each do |integers|
          if sub_array.length == 2
             winning_numbers << integers
          else
            winning_numbers << integers
          end
        end
      end
      winning_numbers.uniq!
      winning_numbers
        # if sub_array.length == 2

        #    winning_numbers << sub_array[-1]
        # else
        #    winning_numbers << sub_array[-1]
        #    winning_numbers.uniq!
        #    winning_numbers
    #     end
    #   end
    end
  end


  def find_block_move(cells)
    human_spaces = human_location(cells)

    human_spaces.map!(&:to_i)

    to_block = []

    @human_winning_combos.each do |sub_array|
      intersect = sub_array & human_spaces
      if intersect.any?
        difference = sub_array - human_spaces
        to_block << difference
      end
    end
    to_block.uniq!
    to_block
  end

  def refine_block_move(cells)
    block_this = find_block_move(cells)
    comp_spaces = comp_location(cells)

    comp_spaces.map!(&:to_i)

    block_num = []

    p block_this
    puts "move to block human in"

    if 
      block_this.each do |sub_array|
        if sub_array.length == 1
          block_num << sub_array

        
        block_num.uniq!
        return block_num
      end
    end
    return false
  end

  def to_block?(cells)
  block_array = refine_block_move(cells)

  final_block = []

  p block_array
  puts "this is the refined block"

    if block_array == false
      return false
    else block_array
      block_array.each do |sub_array|
        sub_array.each do |integers|
          final_block << integers
        end
      end
    end
   final_block
   final_block.map!(&:to_s)
  end

  def reset_block(cells)
    comp_spaces = comp_location(cells)
    block_bool = to_block?(cells)
    # previous_block = find_block_move(cells)

    string_space = comp_spaces.map(&:to_s)
    # previous_block

    p string_space
    puts "string space for computer"

    # if string_space.include? block_
    #    block_bool.clear
    # else
    #     block_bool
    # end
  end

  def possible_moves(cells)

    to_win = win_move(cells)
    # potential_block = reset_block(cells)
    potential_block = to_block?(cells)

    # p to_win
    # puts "winning_move in possible numbers"

    p potential_block
    puts "number to block"

    to_win.map!(&:to_s)


    if to_win.include? "5"
      return "5"
    elsif potential_block
      return potential_block
    else to_win
      return to_win
    end
  end

  def comp_move(move)
    return move[-1]
  end
end
