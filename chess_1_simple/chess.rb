class Player
  attr_reader :name, :age, :elo

  def initialize(name, age, elo)
    @name = name
    @age = age
    @elo = elo
  end

  def self.find_champions(players)
    players.select { |player| player.champion?(players - [player]) }
  end

  def champion?(players)
    players.none? { |other_player| self.eliminated_by?(other_player) }
  end

  private

  def eliminated_by?(other_player)
    (is_weaker_and_older_than(other_player) || is_older_and_weaker_than(other_player))
  end

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
champions = Player.find_champions(players)

puts champions.map { |champion| champion.name }
