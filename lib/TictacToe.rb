require "TictacToe/version"
require_relative "./TictacToe/player.rb"
require_relative "./TictacToe/bot.rb"
require_relative "./TictacToe/spot.rb"
require_relative "./TictacToe/board.rb"
require_relative "./TictacToe/game.rb"
require_relative "./TictacToe/view.rb"
require_relative "./TictacToe/game_menu.rb"

module TictacToe
  game_console = GameMenu.new
end
