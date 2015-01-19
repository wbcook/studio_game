###
# Player class for studio game Ruby app.
###
class Player
  attr_reader :health
  attr_accessor :name


  def initialize name, health=150
    @name, @health = name.capitalize, health
    @found_treasures = Hash.new(0)
  end

  def <=>(other)
    other.score <=> score
  end

  def to_s
    "I'm '#{@name}'!".ljust(20, '.') + " [Health: #{@health}] [Points: #{points}] [Score: #{score}]"
  end

  def w00t
    @health += 15
    puts "#{@name} got w00ted! [#{@health}]"
  end

  def blam
    @health -= 10
    puts "#{@name} got blammed! [#{@health}]"
  end

  def score
    @health + points
  end

  def name=(new_name)
    @name = new_name.capitalize
  end

  def strong?
    @health > 100
  end

  def found_treasure(treasure)
    @found_treasures[treasure.name] += treasure.points
    puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
    puts "#{@name}'s treasures: #{@found_treasures}"
  end

  def points
    @found_treasures.values.reduce(0, :+)
  end

  def each_found_treasure
    @found_treasures.each do |name, points|
      yield Treasure.new(name, points)
    end
  end

end

if __FILE__ == $0
  player = Player.new("moe")
  puts player.name
  puts player.health
  player.w00t
  player.blam
  puts player
end
