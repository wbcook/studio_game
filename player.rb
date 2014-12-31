# Encapsulating behaviors and states of larry, curly, and moe
# using classes, also the methods: to_s, and initialize.
class Player
  attr_reader :health
  attr_accessor :name
  def initialize name, health=150
    @name, @health = name.capitalize, health
  end
  def to_s
    "I'm '#{@name}'!".ljust(20, '.') + " [Health: #{@health}] [Score: #{score}]"
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
    @name.length + @health
  end
  def name=(new_name)
    @name = new_name.capitalize
  end
  def strong?
    @health > 100
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
