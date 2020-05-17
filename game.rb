#You can enter the size of the board (EX: 3x3 or 10x10 grid)
#You can have 2 or more players (human controlled or computer controlled)
class Board
    attr_reader :size

    def initalize
        puts "Enter game size:"
        @size = gets.chomp.to_i
        @board = Array.new(size) {Array.new(size, "_")}
    end
end