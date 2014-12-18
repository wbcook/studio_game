# Encapsulating behaviors and states of larry, curly, and moe
# using classes, also the methods: to_s, and initialize.
require_relative 'player'
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
      player.blam
      player.w00t
    end
    puts @players
    puts "#{@title}".center(50, "*")
  end
end
