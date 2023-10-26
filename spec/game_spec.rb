require_relative '../classes/game'
require_relative '../classes/item'
require 'rspec'

describe Game do
  let(:game) { Game.new(true, Date.new(2020, 1, 1), Date.new(2002, 1, 1)) }

  describe '#can_be_archived?' do
    context 'when last_played_at is more than 2 years ago' do
      it 'returns true' do
        expect(game.can_be_archived?).to be(true)
      end
    end

    context 'when last_played_at is within the last 2 years' do
      it 'returns false' do
        game.last_played_at = Date.new(2022, 1, 1)
        expect(game.can_be_archived?).to be(false)
      end
    end
  end
end
