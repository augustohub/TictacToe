module TictacToe
  class Spot
    attr_accessor :value
    attr_reader :index

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
