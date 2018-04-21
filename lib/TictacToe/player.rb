module TictacToe
  class Player
    attr_accessor :name, :marker

    def initialize(attrs)
      @name   = attrs[:name]
      @marker = attrs[:marker]
    end
  end
end
