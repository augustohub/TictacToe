require 'spec_helper'

module TictacToe
  RSpec.describe Board do
    let (:board) { Board.new }

    context '#initialize' do
      it 'creates a board with empty spots' do
        expect(board.spots.size).to eql(9)
        expect(board.available_spots.size).to eql(9)
      end
    end

    context "place marker" do
      it 'place marker if spot is available' do
        board.place_marker!(1, 'X')
        expect(board.get_spot(1)).to eql('X')
      end

      it 'don\'t place marker if spot is unavailable' do
        board.place_marker!(1, 'X')

        expect(board.place_marker!(1, 'O')).to be false
      end
    end
  end
end
