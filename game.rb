# Encapsulating behaviors and states of larry, curly, and moe
# using classes, also the methods: to_s, and initialize.
require_relative 'player'
require_relative 'die'
class Game
  attr_reader :title
  def initialize(title)
    @title = title
    @players = []
  end
  def add_player(player)
    @players.push(player)
  end
  def play
    puts "There are #{@players.size} players in the game:"
    puts @players
    @players.each do |player|
      die = Die.new
      case die.roll
      when 1..2
         player.blam
      when 3..4
        puts "#{player.name} was skipped!"
      else
        player.w00t
      end
    end
    puts @players
    puts "#{@title}".center(50, "*")
  end
end
