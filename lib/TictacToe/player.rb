module TictacToe
  class Player
    attr_reader :name, :marker

    def initialize(name, marker)
      @name   = name
      @marker = marker
    end

    def move(board, *enemy_marker)
      spot = gets.chomp.to_i
      place_marker!(board, spot, marker)
    end

    def place_marker!(board, spot, marker)
      return false unless board.spot_is_available?(spot)
      board.spots[spot.to_i] = marker

      true
    end
  end
end
