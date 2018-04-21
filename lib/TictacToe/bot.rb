module TictacToe
  class Bot < Player
    def initialize(skill)
      @skill = skill
      @name  = set_name(@skill)
    end

    def move
      sleep(2.seconds)
      # make a move
    end

    def random_move
      # insert mark on random available spot
    end

    def best_move
      # insert mark on a potential best spot
    end

    private

    SKILLS = {3 => 'Dumb', 2 => 'Average', 1 => 'Genius'}.freeze

    GENIUS_CHARS  = ["Rick Sanchez", "Batman", "Tony Stark",
                     "Lisa Simpson", "Stewie Griffin"].freeze

    AVERAGE_CHARS = ["Eric Cartman", "Bart Simpson", "Mickey Mouse",
                     "Wall-E", "Deadpool", "Bender"].freeze

    DUMB_CHARS    = ["Spongebob", "Patrick Star", "Peter Griffin",
                     "Homer Simpson", "Morty Smith", "Dory"].freeze

    # Showing Off some metaprogramming
    def set_name(skill_level)
      self.class.const_get("#{SKILLS[skill_level].upcase}_CHARS").shuffle.first
    end
  end
end
