require 'spec_helper'

module TictacToe
  RSpec.describe Player do
    let (:mike) { Player.new(name: 'Mike', marker: 'X') }
    let (:sam)  { Player.new(name: 'Sam',  marker: 'O') }

    context '#initialize' do
      it 'initializes with correct attributes' do
        expect { sam }.to_not raise_error
      end

      it 'raises an error initializes without correct attributes' do
        expect { Player.new }.to raise_error(ArgumentError)
      end
    end
  end
end
