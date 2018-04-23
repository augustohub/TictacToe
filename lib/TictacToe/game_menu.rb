module TictacToe
  class GameMenu

    def initialize
      @view = View.new
      @x = "\e[31mX\e[0m"
      @o = "\e[32mO\e[0m"
      setup_game
    end

    def setup_game
      request_player_mode
      start_game
    end

    def setup_players(mode)
      @player1, @player2 = case mode
                           when 1
                             [build_human_player(@x), build_human_player(@o)]
                           when 2
                             [build_human_player(@x), build_bot(@o)]
                           when 3
                             [build_bot(@x), build_bot(@o)]
                           end
    end

    def build_bot(marker)
      @view.render_bot_skill_menu
      skill_level = gets.chomp.to_i
      Bot.new(skill_level, marker)
    end

    def build_human_player(marker)
      @view.request_player_name(marker)
      name = gets.chomp
      Player.new(name, marker)
    end

    def request_player_mode
      @view.render_player_mode_menu
      mode = gets.chomp.to_i
      setup_players(mode)
    end

    def start_game
      @game = Game.new(@player1, @player2).start
    end
  end
end
