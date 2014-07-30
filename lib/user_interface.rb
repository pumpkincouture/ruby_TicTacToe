require_relative 'human_player.rb'




class UserInterface

      
      def initialize(human_player)
      @human_player=human_player
      end

    def user_prompt
    puts "Please choose a number for your 'O'."
    end
    
    def choice
    puts "You chose space number #{@human_player.human_answer}."
    end
    
    def user_error
    puts "I'm sorry, that is not a valid move, please try again."
    end
   
  end