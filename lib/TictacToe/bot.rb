require 'yaml'

module TictacToe
  class Bot < Player
    attr_accessor :skill, :marker, :name

    def initialize(skill, marker)
      @skill  = skill
      @name   = set_name(skill)
      @marker = marker
    end

    def move(board, enemy_marker)
      sleep 2
      aux_board = board.dup


      #board.place_marker!(6)
      random_move(board)
    end

    #private

    def random_move(board)
      spot = board.available_spots.sample
      place_marker!(board, spot, @marker)
    end

    def get_best_move(board)
      board.available_spots.each do |as|
        board.spot(as).value = marker
      end
    end

    def first_player?(board)
      board.is_empty?
    end

    def first_move(board)
      if genius?
        if first_player? || board.corners_are_empty?
          place_marker_on_a_corner
        else
          place_marker_on_center
        end
      else
        random_move(board.available_spots)
      end
    end

    def place_marker_on_a_corner
      board.place_marker!(Board::CORNERS.sample, @marker)
    end

    def place_marker_on_center
      board.place_marker!(4, @marker)
    end

    SKILLS = {3 => 'Dumb', 2 => 'Average', 1 => 'Genius'}.freeze

    def set_name(skill_level)
      bot_names = YAML.load_file('./lib/strings.yml')
      bot_names['Bot Names'][SKILLS[skill_level]].sample
    end

    SKILLS.each do |skill, skill_name|
      define_method("#{skill_name.downcase}?") do
        @skill == skill
      end
    end
  end
end
