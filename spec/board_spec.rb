require 'spec_helper'

module TictacToe
  RSpec.describe Board do
    context '#initialize' do
      it 'creates a board with empty spots' do
        board = Board.new
        expect(board.spots.size).to eql(9)
        expect(board.available_spots.size).to eql(9)
      end
    end

    context 'gets the marker of an spot' do
      it 'returns the marker based on his index' do
        board = Board.new
        board.spot(3).value = "X"
        expect(board.spot_value(3)).to eql("X")
      end
    end
  end
end
