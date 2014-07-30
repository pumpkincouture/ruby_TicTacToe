require_relative 'user_interface.rb'




class HumanPlayer
    attr_reader :human_answer
    
    def initialize
    @human_answer=human_answer
    end

 def user_turn(ui)
    ui.user_prompt
    @human_answer=gets.chomp
    end

end