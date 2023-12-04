require './chess.rb'
require 'rspec'

# Je ne me suis pas concentré sur la rédaction des tests, ni leur qualité.
# Ils sont juste là pour appuyer le code.

RSpec.describe Player do
  describe '#find_champions' do
    let(:players) { [pierre, marie, clemence, fred, alice, bob] }

    context 'with 6 challengers' do
      let(:pierre) { Player.new('pierre', 19, 1900) }
      let(:marie) { Player.new('marie', 17, 1850) }
      let(:clemence) { Player.new('clemence', 19, 1900) }
      let(:fred) { Player.new('fred', 23, 1900) }
      let(:alice) { Player.new('alice', 24, 2300) }
      let(:bob) { Player.new('bob', 18, 1800) }

      it 'returns an array of champions' do
        expect(Player.find_champions(players)).to eq(["marie", "pierre", "clemence", "alice"])
      end
    end

    context 'with 6 other challengers' do
      let(:pierre) { Player.new('pierre', 19, 1900) }
      let(:marie) { Player.new('marie', 17, 1850) }
      let(:clemence) { Player.new('clemence', 19, 1900) }
      let(:fred) { Player.new('fred', 20, 1900) }
      let(:alice) { Player.new('alice', 24, 2300) }
      let(:bob) { Player.new('bob', 18, 2200) }

      it 'returns an array of champions' do
        expect(Player.find_champions(players)).to eq(["marie", "bob", "alice"])
      end
    end
  end
end
