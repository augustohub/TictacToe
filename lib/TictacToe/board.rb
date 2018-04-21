module TictacToe
  class Board
    def initialize
      @board = initialize_spots
    end

    def render
      puts " #{spot_value(0)} | #{spot_value(1)} | #{spot_value(2)} \n" \
           "===+===+===\n"                                              \
           " #{spot_value(3)} | #{spot_value(4)} | #{spot_value(5)} \n" \
           "===+===+===\n"                                              \
           " #{spot_value(6)} | #{spot_value(7)} | #{spot_value(8)} \n"
    end

    def available_spots
      @board.map { |spot| spot if spot.available?}
    end

    def spot_value(index)
      @board[index].value
    end

    private

    def initialize_spots
      (0..8).map { |i| Spot.new(i) }
    end
  end
end
