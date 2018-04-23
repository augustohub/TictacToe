module TictacToe
  class Board
    attr_reader :spots

    def initialize
      @spots = initialize_spots
    end

    def available_spots
      @spots.map { |spot| spot if spot_is_available?(get_index(spot)) }.compact
    end

    def is_empty?
      available_spots.size == 9
    end

    def spot_is_available?(spot)
      get_spot(spot) == spot.to_s
    end

    def get_spot(index)
      @spots[index.to_i]
    end

    def get_index(spot)
      @spots.index(spot)
    end

    def game_over?
      return true if has_winner? || tie?
      false
    end

    def has_winner?
      return false unless winner
      true
    end

    def tie?
      available_spots.none? && !has_winner?
    end

    def winner
      WINNING_CASES.any? do |indexes|
        marker_combo = indexes.map { |i| get_spot(i) }.uniq
        return marker_combo[0] if marker_combo.length == 1
      end
    end

    private

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

    def initialize_spots
      (0..8).to_a.map(&:to_s)
    end
  end
end
