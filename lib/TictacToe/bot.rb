require 'yaml'

module TictacToe
  class Bot < Player
    attr_accessor :skill, :name

    def initialize(skill, marker)
      @skill  = skill
      @name   = set_name(skill)
      @marker = marker
    end

    def move(board, enemy_marker)
      @enemy_marker = enemy_marker
      @board = board
      sleep 2
      if genius?
        minmax_move(board)
      elsif average?
        random_move(board) if first_move?(board)
        minmax_move(board)
      else
        random_move(board)
      end
    end

    def first_move?(board)
      board.is_empty? || board.available_spots == 8
    end

    def random_move(board)
      spot = board.available_spots.sample
      place_marker!(board, spot, @marker)
    end

    def minmax_move(board)

      aux_board = board.dup
      puts "ENTROOOOU"
      puts board.spots.join(',')
      spot = minmax(aux_board, @marker)[0]
      puts spot
      place_marker!(board, spot, @marker)
    end

    SKILLS = {3 => 'Dumb', 2 => 'Average', 1 => 'Genius'}.freeze

    SKILLS.each do |skill, skill_name|
      define_method("#{skill_name.downcase}?") do
        @skill == skill
      end
    end

    private

    def set_name(skill_level)
      bot_names = YAML.load_file('./lib/strings.yml')
      bot_names['Bot Names'][SKILLS[skill_level]].sample
    end

    def minmax(board, marker)
      return score(board) if board.game_over?
      scores = {}

      board.available_spots.each do |spot|
        aux_board = Marshal.load(Marshal.dump(board))
        aux_board.spots[spot.to_i] = marker
        scores[spot] = minmax(aux_board, switch_markers(marker))
      end

      best_choice, best_score = best_move(marker, scores)
      [best_choice, best_score]
    end

    def switch_markers(marker)
      marker == @marker ? @enemy_marker : @marker
    end

    def score(board)
      if board.winner == @marker
        return 10
      elsif board.winner == @enemy_marker
        return -10
      end
      0
    end

    def best_move(marker, scores)
      if marker == @marker
        scores.max
      else
        scores.min
      end
    end
  end
end
