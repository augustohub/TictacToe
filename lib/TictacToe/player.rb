module TictacToe
  class Player
    attr_accessor :name

    def initialize(name)
      @name = name
    end

    def bot?
      is_a?(Bot)
    end
  end
end
