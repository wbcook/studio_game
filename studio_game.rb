###
# Main file for three stooges studio game Ruby app.
###
require_relative 'player'
require_relative 'game'

#larry = Player.new "larry"
#moe = Player.new "moe", 60
#curly = Player.new "curly", 125

#knuckleheads = Game.new("Knuckleheads")
#knuckleheads.add_player(larry)
#knuckleheads.add_player(moe)
#knuckleheads.add_player(curly)
#knuckleheads.play(2)
#knuckleheads.print_stats
knuckleheads = Game.new("Knuckleheads")
loop do
  puts "\How many game rounds? ('quit' to exit)"
  answer = gets.chomp.downcase
  case answer
  when /^\d+$/
    knuckleheads.load_players(ARGV.shift || "players.csv")
    knuckleheads.play(answer.to_i)
  when 'quit', 'exit'
    knuckleheads.print_stats
    knuckleheads.save_high_scores
    break
  else
    puts "Please enter a number or 'quit'"
  end
end

#chipmunks = Game.new("Chipmunks")
#chipmunks.add_player(Player.new "alvin", 50)
#chipmunks.add_player(Player.new "simon", 80)
#chipmunks.add_player(Player.new "theodore", 130)
#chipmunks.play(2)
#chipmunks.print_stats
