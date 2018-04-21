require 'spec_helper'

module TictacToe
  RSpec.describe Player do
    context '#initialize' do
      it 'initializes with correct attributes' do
        name = 'Player1'
        expect { Player.new(name) }.to_not raise_error
      end

      it 'raises an error initializes without correct attributes' do
        expect { Player.new }.to raise_error(ArgumentError)
      end
    end

    context 'who am I?' do
      it 'is a Human!' do
        player = Player.new('A Guy')
        expect(player.bot?).to be_falsey
      end
    end
  end
end
