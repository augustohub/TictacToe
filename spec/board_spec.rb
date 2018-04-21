require 'spec_helper'

module TictacToe
  RSpec.describe Board do
    context '#initialize' do
      it 'creates a board with empty spots' do
        board = Board.new
        expect(board).to have_exactly(9).items
      end
    end
  end
end
