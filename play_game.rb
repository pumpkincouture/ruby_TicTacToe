require './lib/game'
require './lib/board'
require './lib/computer_player'
require './lib/human_player'
require './lib/user_interface'



new_game= Game.new
new_game.start

until new_game.game_over?
new_game.play_game
end