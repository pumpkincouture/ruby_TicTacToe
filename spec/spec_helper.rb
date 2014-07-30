require '../lib/game.rb'
require '../lib/board.rb'
require '../lib/computer_player.rb'
require '../lib/human_player.rb'
require '../lib/user_interface.rb'
# require '../lib/Class_TTT_7-28_2'

RSpec.configure do |config|
  # config.color_enabled = true
  config.failure_color= :red
  config.success_color= :green
  config.detail_color= :yellow
  config.tty = true
  config.color= true
  config.formatter = :documentation
end