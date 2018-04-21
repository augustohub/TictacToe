require 'spec_helper'

module TictacToe
  RSpec.describe Player do
    context '#initialize' do
      it 'initializes with correct attributes' do
        name = 'Player1'
        expect { Player.new(name).to_not raise_error }
      end

      it 'raises an error initializes without correct attributes' do
        expect { Player.new }.to raise_error(ArgumentError)
      end
    end
  end
end
