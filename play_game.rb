require './lib/game'
require './lib/board'
require './lib/computer_player'
require './lib/human_player'
require './lib/user_interface'

computer_player = ComputerPlayer.new
human_player = HumanPlayer.new
ui = UserInterface.new
board = Board.new(ui)


new_game = Game.new(computer_player, human_player, ui, board)

new_game.start

until new_game.game_over?
new_game.play_game
end