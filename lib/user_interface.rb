require_relative 'human_player.rb'




class UserInterface
    
    def welcome(board)
    puts "Welcome to a Simpler Tic Tac Toe. The computer will go first."
    board.cells["5"] = "X"
    puts "The computer chose space number 5."
    display_board(board.cells)
    end

    def user_prompt
    puts "Please choose a number for your 'O'."
    end
    
    def human_choice(answer)
    puts "You chose space number #{answer}."
    end

    def computer_choice(answer)
    puts "Computer chose space number #{answer}."
    end

    def human_wins
    puts "Human won!"
    end

    def computer_wins
    puts "Computer won!"
    end
    
    def user_error
    puts "I'm sorry, that is not a valid move, please try again."
    end


    def display_board(board)
    puts "#{board["1"]} | #{board["2"]} | #{board["3"]}"
    puts "---------"
    puts "#{board["4"]} | #{board["5"]} | #{board["6"]}"
    puts "---------"
    puts "#{board["7"]} | #{board["8"]} | #{board["9"]}"
    end 


   
  end

