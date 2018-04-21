require 'spec_helper'

module TictacToe
  RSpec.describe Spot do
    context '#initialize' do
      it 'initializes with correct attributes' do
        expect { Spot.new('1') }.to_not raise_error
      end

      it 'raises an error initializes without correct attributes' do
        expect { Spot.new }.to raise_error(ArgumentError)
      end

      it 'should be available to place markers' do
        spot = Spot.new('1')
        expect(spot.available?).to be true
      end
    end

    context 'when try to place a marker' do
      it 'gets placed if spot is available' do
        spot = Spot.new('1')
        spot.place_marker!('x')
        expect(spot.available?).to be false
      end
    end
  end
end
