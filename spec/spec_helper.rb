require_relative '../lib/game.rb'
require_relative '../lib/board.rb'
require_relative '../lib/computer_player.rb'
require_relative '../lib/human_player.rb'
require_relative '../lib/user_interface.rb'

RSpec.configure do |config|
  config.failure_color = :red
  config.success_color = :green
  config.detail_color = :yellow
  config.tty = true
  config.color = true
  config.formatter = :documentation
end