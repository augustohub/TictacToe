require 'spec_helper'
require 'yaml'

module TictacToe
  RSpec.describe Bot do
    context '#initialize' do
      it 'initializes with correct attributes' do
        skill = 1
        marker = 'X'
        expect { Bot.new(skill, marker) }.to_not raise_error
      end

      it 'raises an error initializes without correct attributes' do
        expect { Bot.new }.to raise_error(ArgumentError)
      end

      it 'sets a Genius name if it has a Genius skill' do
        bot = Bot.new(1, 'X')
        strings = YAML.load_file('./lib/strings.yml')
        genius_names = strings['Bot Names']['Genius']
        expect(genius_names).to include(bot.name)
      end
    end
  end
end
