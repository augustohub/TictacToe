module TictacToe
  class View
    STRINGS_FILE = YAML.load_file('./lib/strings.yml')
    GAME_STRINGS = STRINGS_FILE['In Game']
    MENU_STRINGS = STRINGS_FILE['Menu']

    def refresh_game_screen(board)
      clear_screen
      render_board(board)
    end

    def clear_screen
      puts `clear`
    end

    def render_board(board)
      puts " #{board[0]} | #{board[1]} | #{board[2]} \n"
      puts "===+===+===\n"
      puts " #{board[3]} | #{board[4]} | #{board[5]} \n"
      puts "===+===+===\n"
      puts " #{board[6]} | #{board[7]} | #{board[8]} \n"
    end

    def render_player_mode_menu
      puts 'Select Player Mode:'
      puts '1) Player VS Player'
      puts '2) Player VS Computer'
      puts '3) Computer VS Computer'
    end

    def render_bot_skill_menu
      puts 'Select Bot Skill:'
      options = Bot::SKILLS.to_a.reverse.to_h
      options.each do |key, skill|
        puts "#{key}) #{skill}"
      end
    end

    def display_winner(player)
      puts GAME_STRINGS['Winner Message'].sample.gsub('%{player}', player)
    end

    def move_request_phrase(player)
      puts GAME_STRINGS['Move Request'].sample.gsub('%{player}', player)
    end

    def draw_phrase
      puts GAME_STRINGS['Draw Message'].sample
    end

    def invalid_move_warning
      puts GAME_STRINGS['Invalid Move'].sample
    end

    def request_player_name(marker)
      puts MENU_STRINGS['Player Name'].gsub('%{marker}', marker)
    end

    def restart_game
      puts MENU_STRINGS['Restart']
    end
  end
end
