module TictacToe
  class Spot
    attr_accessor :value

    def initialize(index)
      @value = index
      @index = index
    end

    def available?
      @value == @index
    end

    def place_marker!(marker)
      @value = marker
    end
  end
end
