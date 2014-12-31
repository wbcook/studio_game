# Rolls high, medium or low dice rolls to determine a w00t or blam on a player.

class Die
  attr_reader :number
  
  def initialize
    roll
  end

  def roll
    @number = rand(1..6)
  end
end
