require './chess.rb'
require 'rspec'

# Je ne me suis pas concentré sur la rédaction des tests, ni leur qualité.
# Ils sont juste là pour appuyer le code.

RSpec.describe Player do
  describe '#champion?' do
    context 'with 6 challengers' do
      let(:pierre) { Player.new('pierre', 19, 1900) }
      let(:marie) { Player.new('marie', 17, 1850) }
      let(:clemence) { Player.new('clemence', 19, 1900) }
      let(:fred) { Player.new('fred', 23, 1900) }
      let(:alice) { Player.new('alice', 24, 2300) }
      let(:bob) { Player.new('bob', 18, 1800) }
      let(:players) { [pierre, marie, clemence, fred, alice, bob] }

      it 'returns true if challenger is pierre' do
        expect(pierre.champion?(players)).to be true
      end

      it 'returns true if challenger is marie' do
        expect(marie.champion?(players)).to be true
      end

      it 'returns true if challenger is clemence' do
        expect(clemence.champion?(players)).to be true
      end

      it 'returns false if challenger is fred' do
        expect(fred.champion?(players)).to be false
      end

      it 'returns true if challenger is alice' do
        expect(alice.champion?(players)).to be true
      end

      it 'returns false if challenger is bob' do
        expect(bob.champion?(players)).to be false
      end
    end

    context 'with 6 other challengers' do
      let(:pierre) { Player.new('pierre', 19, 1900) }
      let(:marie) { Player.new('marie', 17, 1850) }
      let(:clemence) { Player.new('clemence', 19, 1900) }
      let(:fred) { Player.new('fred', 20, 1900) }
      let(:alice) { Player.new('alice', 24, 2300) }
      let(:bob) { Player.new('bob', 18, 2200) }
      let(:players) { [pierre, marie, clemence, fred, alice, bob] }

      it 'returns false if challenger is pierre' do
        expect(pierre.champion?(players)).to be false
      end

      it 'returns true if challenger is marie' do
        expect(marie.champion?(players)).to be true
      end

      it 'returns false if challenger is clemence' do
        expect(clemence.champion?(players)).to be false
      end

      it 'returns false if challenger is fred' do
        expect(fred.champion?(players)).to be false
      end

      it 'returns true if challenger is alice' do
        expect(alice.champion?(players)).to be true
      end

      it 'returns true if challenger is bob' do
        expect(bob.champion?(players)).to be true
      end
    end
  end
end
