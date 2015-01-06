# Run tests with rspec game_spec.rb --color
# Run ALL _spec.rb tests in the directory with rspec . -- color
# This tests the player class.
require_relative 'game'

describe Game do

  before do
    @game = Game.new("Knuckleheads")

    @initial_health = 100
    @player = Player.new("moe", @initial_health)

    @game.add_player(@player)
  end
  it "w00ts the player when a high number is rolled" do
    Die.any_instance.stub(:roll).and_return(5)

    @game.play(2)

    @player.health.should == @initial_health + (15 * 2)
  end
  it "should do nothing to the player when a medium number is rolled" do
    Die.any_instance.stub(:roll).and_return(3)

    @game.play(2)
    @player.health.should == @initial_health
  end
  it "should blam the player when a low number is rolled" do
    Die.any_instance.stub(:roll).and_return(1)

    @game.play(2)
    @player.health.should == @initial_health - (10 * 2)
  end

end
