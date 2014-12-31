# Run tests with rspec player_spec.rb --color
# Run ALL _spec.rb tests in the directory with rspec . -- color
# This tests the player class.
require_relative 'player'

describe Player do
  before do
    $stdout = StringIO.new
    @initial_health = 150
    @player = Player.new("larry", @initial_health)
  end
  it "has a capitalized name" do

    @player.name.should == "Larry"
  end
  it "has an initial health" do

    @player.health.should == 150
  end
  it "has a string representation" do

    @player.to_s.should == "I'm 'Larry'!".ljust(20, '.') + " [Health: 150] [Score: 155]"
  end
  it "computes a score as a sum of health and length of name" do

    @player.score.should == (@initial_health + @player.name.length)
  end
  it "increases health by 15 when w00ted" do
    
    @player.w00t
    @player.health.should == @initial_health + 15
  end
  it "decreases health by 10 when blammed" do
    
    @player.blam
    @player.health.should == @initial_health - 10
  end
  context "with a health greater than 100" do
    before do
      @player = Player.new("larry", 150)
    end
    
    it "is strong" do
      @player.should be_strong
    end
  end
  context "with a health less than 100" do
    before do
      @player = Player.new("larry", 50)
    end

    it "is wimpy" do
      @player.should_not be_strong
    end
  end
end
