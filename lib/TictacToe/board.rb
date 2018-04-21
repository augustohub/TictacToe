module TictacToe
  class Board
    attr_reader :spots

    def initialize
      @spots = initialize_spots
    end

    def render
      puts " #{spot_value(0)} | #{spot_value(1)} | #{spot_value(2)} \n" \
           "===+===+===\n"                                              \
           " #{spot_value(3)} | #{spot_value(4)} | #{spot_value(5)} \n" \
           "===+===+===\n"                                              \
           " #{spot_value(6)} | #{spot_value(7)} | #{spot_value(8)} \n"
    end

    def available_spots
      spots.map { |s| s if s.available? }
    end

    def spot(index)
      spots[index]
    end

    def spot_value(index)
      spot(index).value
    end

    private

    def initialize_spots
      (0..8).map { |i| Spot.new(i) }
    end
  end
end
