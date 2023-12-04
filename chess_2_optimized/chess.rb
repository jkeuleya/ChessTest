class Player
  attr_reader :name, :age, :elo

  def initialize(name, age, elo)
    @name = name
    @age = age
    @elo = elo
  end

  def self.find_champions(players)
    players = players.sort_by(&:age) # Sort by age, optimization for large arrays
    champions = []

    players.each do |player|
      is_champion = true

      players.each do |other_player|
        # Since we sorted by age, if other_player is older, we stop looping.
        # We already know that analyzing older challengers won't eliminate current challenger
        break if other_player.age > player.age

        next if other_player == player

        if player.eliminated_by?(other_player)
          is_champion = false
          break
        end
      end

      champions << player.name if is_champion
    end

    champions
  end

  def eliminated_by?(other_player)
    (is_weaker_and_older_than(other_player) || is_older_and_weaker_than(other_player))
  end

private

  def is_weaker_and_older_than(other_player)
    other_player.elo > @elo && other_player.age <= @age
  end

  def is_older_and_weaker_than(other_player)
    other_player.age < @age && other_player.elo >= @elo
  end
end

# Instanciating players
pierre = Player.new('pierre', 19, 1900)
marie = Player.new('marie', 17, 1850)
clemence = Player.new('clemence', 19, 1900)
fred = Player.new('fred', 23, 1900)
alice = Player.new('alice', 24, 2300)
bob = Player.new('bob', 18, 1800)

# Building the players list
players = [pierre, marie, clemence, fred, alice, bob]


# Returns and display champions' name
puts Player.find_champions(players).inspect
