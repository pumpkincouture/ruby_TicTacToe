require './lib/game'
require './lib/board'
require './lib/computer_player'
require './lib/human_player'
require './lib/user_interface'
require './lib/intel_computer_player'
require './lib/set_up.rb'


setup = SetUp.new

setup.create_instances
setup.choose_player


new_game = Game.new(setup.player, setup.human_player, setup.ui, setup.board)
new_game.first_move

until new_game.game_over?(setup.board.cells)
  new_game.play_game
end

new_game.end_game_message(new_game.winner?(new_game.computer_spaces(setup.board.cells), new_game.human_spaces(setup.board.cells)))