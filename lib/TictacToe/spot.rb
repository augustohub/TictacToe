module TictacToe
  class Spot
    attr_accessor :value

    def initialize(index)
      @value = nil
      @index = index
    end

    def available?
      @value.nil?
    end

    def place_marker!(marker)
      @value = marker
    end
  end
end