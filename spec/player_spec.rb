require 'spec_helper'

RSpec.describe "Player" do
  context '#initialize' do
    it 'initializes with correct attributes' do
      attrs = { name: 'Player1', marker: 'X' }
      expect { Player.new(attrs).to_not raise_error }
    end
  end
end
