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
      available_spots.none?
    end

    def corners_are_empty?
      CORNERS.any? { |corner_index| spot_is_available?(corner_index) }
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

    private

    def initialize_spots
      (0..8).to_a.map(&:to_s)
    end

    CORNERS = [0, 2, 6, 8]
  end
end
