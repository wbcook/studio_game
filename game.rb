###
# Game class for studio game Ruby app.
###
require_relative 'player'
require_relative 'game_turn'
require_relative 'treasure_trove'

class Game
  attr_reader :title
  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players.push(player)
  end

  def play(rounds)
    puts "There are #{@players.size} players in the game:"
    puts @players
    1.upto(rounds) do |round|
      puts "\nRound: #{round}"
      @players.each do |player|
        GameTurn.take_turn(player)
      end
    end
    puts @players
    puts "#{@title}".center(50, "*")
    treasures = TreasureTrove::TREASURES
    puts "\nThere are #{treasures.size} treasures to be found:"
    treasures.each do |treasure|
      puts "A #{treasure.name} is worth #{treasure.points} points"
    end
  end

  def print_name_and_health(player)
    puts "#{player.name} (#{player.health})"
  end

  def print_stats
    strong_players, whimpy_players = @players.partition { |player| player.strong? }
    puts "\n#{title} Statistics:"
    puts "\n#{strong_players.size} strong players:"
    strong_players.each do |player|
      print_name_and_health(player)
    end
    puts "\n#{whimpy_players.size} whimpy players:"
    whimpy_players.each do |player|
      print_name_and_health(player)
    end
    puts "\nLeaderboard: "
    @players.sort.each do |player|
      puts "#{player.name}".ljust(20, '.') + " #{player.score}"
      puts "\n#{player.name}'s point totals:"
      puts "#{player.points} grand total points"
    end
    @players.sort.each do |player|
      puts "\n#{player.name}'s point totals:"
      player.each_found_treasure do |treasure|
        puts "#{treasure.points} total #{treasure.name} points"
      end
      puts "#{player.points} grand total points"
    end

  end
  
  def load_players(from_file)
    File.readlines(from_file).each do |line|
      name, health = line.split(',')
      player = Player.new(name, Integer(health))
      add_player(player)
    end
  end

   def save_high_scores(to_file="high_scores.txt")
     File.open(to_file, "w") do |file|
       @players.sort.each do |player|
         file.puts "#{player.name},#{player.score}"
       end
     end
   end

end
