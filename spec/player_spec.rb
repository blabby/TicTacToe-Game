require "./lib/player.rb"

describe Player do
    describe "#initialize" do
    it "should take in a name and a symbol input" do
        player_instance = Player.new("Jack", :X)
        expect(player_instance.name).to eql("Jack")
        expect(player_instance.sym).to eql(:X)
        end

    it "should have an ai instance variable set to false" do
        player_instance = Player.new("Jack", :X)
        expect(player_instance.ai).to eql(false)
        end
    end
end