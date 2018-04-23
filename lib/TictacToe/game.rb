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
    end

    def game_is_over
      return true if has_winner? || tie?
      false
    end

    def has_winner?
      return false if WINNING_CASES.none? do |indexes|
        indexes.map { |i| @board.get_spot(i) }.uniq.length == 1
      end
      display_winner
      true
    end

    def tie?
      return false if @board.available_spots.any?
      @view.draw_phrase
      true
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

    WINNING_CASES = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ].freeze
  end
end
