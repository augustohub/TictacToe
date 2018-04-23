module TictacToe
  class Spot
    attr_accessor :value
    attr_reader :index

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
