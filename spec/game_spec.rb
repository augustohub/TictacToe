require 'spec_helper'

module TictacToe
  RSpec.describe Game do
    let (:mike) { Player.new(name: 'Mike', marker: 'X') }
    let (:sam)  { Player.new(name: 'Sam',  marker: 'O') }
    let (:game) { Game.new(mike, sam) }

    context '#initialize' do
      it 'initializes with correct attributes' do
        expect { game }.to_not raise_error
      end
    end

    context 'place a marker on spot' do
      it 'check if has winner' do
        game.board.spots[1] = 'X'
        game.board.spots[4] = 'X'
        game.board.spots[7] = 'X'

        expect(game.has_winner?).to be true
        expect(game.game_is_over).to be true
      end
    end
  end
end
