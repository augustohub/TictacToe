require 'yaml'

module TictacToe
  class Game
    attr_reader :board

    def initialize(player1, player2)
      @view    = View.new
      @board   = Board.new
      @player1 = player1
      @player2 = player2
      @current_player, @idle_player = [@player1, @player2].shuffle
    end

    def start
      until game_is_over
        change_current_player
        refresh_screen
        request_move
        refresh_screen
      end
      display_winner if @board.has_winner?
      @view.draw_phrase if @board.tie?
    end

    def game_is_over
      board.game_over?
    end

    private

    def change_current_player
      @current_player, @idle_player = @idle_player, @current_player
    end

    def enemy_marker
      @idle_player.marker
    end

    def request_move
      @view.move_request_phrase(@current_player.name)
      until @current_player.move(@board, enemy_marker)
        @view.invalid_move_warning
        @view.move_request_phrase(@current_player.name)
      end
    end

    def display_winner
      @view.display_winner(@current_player.name)
    end

    # Entry validations
    def valid_entry?(entry)
      return false unless entry_is_an_integer?(entry)
      return false unless spot_is_available?(entry)
      true
    end

    def entry_is_integer?(entry)
      entry.to_i.to_s == entry
    end

    def spot_is_available(entry)
      @board.spot_is_available?(entry)
    end

    # View Methods
    def refresh_screen
      @view.refresh_game_screen(@board.spots)
    end
  end
end
