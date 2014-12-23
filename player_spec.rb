# Test examples for our Player class.
require_relative 'player'

describe Player do
  it "has a capitalized name" do
    player = Player.new("larry", 150)

    player.name.should == "Larry"
  end
end
