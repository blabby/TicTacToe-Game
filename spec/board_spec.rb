require "./lib/board.rb"

describe Board do
    describe "#initialize" do
    it "it should have an instance variable for board size" do
        brd = Board.new
        expect(brd.size).to eql(3) #enter 3 for input
        end

    it "it should have an instance variable for the board depending on size" do
        brd = Board.new
        expect(brd.board.length).to eql(9) #equal to brd.size * brd.size
    end

    it "it should have an instance variable for the number of computer players" do
        brd = Board.new
        expect(brd.computer).to eql(1) #enter 1 for input
    end

    it "it should have an instance variable for the number of human players" do
        brd = Board.new
        expect(brd.human).to eql(1) #enter 1 for input
    end

    it "it should have an instance array for human players" do
        brd = Board.new
        expect(brd.players.length).to eql(1) #enter 1 for input
        end

    it "it should have an instance variable for computer players" do
        brd = Board.new
        expect(brd.computer).to eql(1) #enter 1 for input
        end
    end

    describe "#win?" do #to test these conditions place tiles to achieve these conditions
        it "it should return false if win conditions aren't met" do
            brd = Board.new
            expect(brd.win?).to eql(true) 
        end

        it "it should return true if there is a horizontal win" do
            brd = Board.new
            expect(brd.win?).to eql(true) 
        end

        it "it should return true if there is a vertical win" do
            brd = Board.new
            expect(brd.win?).to eql(true) 
        end

        it "it should return true if there is a diagonal win" do
            brd = Board.new
            expect(brd.win?).to eql(true) 
        end 
    end

    describe "#lose?" do
    end 



    describe "#run" do
    it "should continue until win? or lose? conditions met" do
        end
    end
end