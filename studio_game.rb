# Encapsulating behaviors and states of larry, curly, and moe
# using classes, also the methods: to_s, and initialize.
require_relative 'player'
require_relative 'game'
# Output goes here...
larry = Player.new "larry"
moe = Player.new "moe", 60
curly = Player.new "curly", 125

knuckleheads = Game.new("Knuckleheads")
knuckleheads.add_player(larry)
knuckleheads.add_player(moe)
knuckleheads.add_player(curly)
knuckleheads.play(2)

chipmunks = Game.new("Chipmunks")
chipmunks.add_player(Player.new "alvin", 50)
chipmunks.add_player(Player.new "simon", 80)
chipmunks.add_player(Player.new "theodore", 130)
chipmunks.play(2)

# EOF :)
