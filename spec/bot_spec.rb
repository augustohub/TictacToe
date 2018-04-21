require 'spec_helper'

module TictacToe
  RSpec.describe Bot do
    context '#initialize' do
      it 'initializes with correct attributes' do
        skill = 1
        expect { Bot.new(skill) }.to_not raise_error
      end

      it 'raises an error initializes without correct attributes' do
        expect { Bot.new }.to raise_error(ArgumentError)
      end

      it 'sets a Genius name if it has a Genius skill' do
        bot = Bot.new(1)
        genius_names = Bot::GENIUS_CHARS
        expect(genius_names).to include(bot.name)
      end
    end

    context 'who am I?' do
      it 'is a Robot!' do
        bot = Bot.new(1)
        expect(bot.bot?).to be_truthy
      end
    end
  end
end
