require "./lib/computer.rb"

describe Computer do
    describe "#initialize" do
    it "should take in a name and a symbol input" do
        computer_instance = Computer.new("Jack", :X)
        expect(computer_instance.name).to eql("Jack")
        expect(computer_instance.sym).to eql(:X)
        end

    it "should have an ai instance variable set to true" do
        computer_instance = Computer.new("Jack", :X)
        expect(computer_instance.ai).to eql(true)
        end
    end
end