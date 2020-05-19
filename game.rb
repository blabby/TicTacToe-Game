    require_relative "player.rb"
class Board
    #Add players and computers
    #Method to switch between players
    #If someone wins should show their symbol/name
    attr_reader :size, :board, :sym, :players
    def initialize
        puts "Enter game size:"
        @size = gets.chomp.to_i
        @board = Array.new(@size) {Array.new(@size, "_")}
        #will get rid of this sym gets after
        # puts "Enter your symbol"
        # @sym = gets.chomp.to_sym
        puts "How many computer players?"
        @computer = gets.chomp.to_i
        puts "How many human players?"
        @human  = gets.chomp.to_i
        @players = []
        add_human_players(@human)
    end

    def run
        puts "Welcome to TicTacToe!"
        until win?(@sym) || lose?
            self.display
            puts "Enter position. (EX: 0 0 for position 1 on board)"
            pos = gets.chomp.split(" ").map(&:to_i)
            while !legal_position?(pos)
                puts "Invalid position, please try again. (EX: 0 0 for position 1 on board)"
                pos = gets.chomp.split(" ").map(&:to_i)
            end
            self.placement(pos)
        end
        self.display
        puts "GAME OVER!"
    end

    def add_human_players(n)
        (1..n).each do |player|
            puts "Enter player #{player}'s' name"
            name = gets.chomp
            puts "Enter player #{player}'s symbol"
            symbol = gets.chomp.to_sym
            players << Player.new(name, symbol)
        end
    end

    def add_computer_players
        (1..n).each do |player|
            puts "Enter player #{player}'s' name"
            name = gets.chomp
            puts "Enter player #{player}'s symbol"
            symbol = gets.chomp.to_sym
            players << Computer.new(name, symbol)
        end
    end

    def switch
        #switch players
    end

    def placement(pos)
        @board[pos[0]][pos[1]] = @sym
    end

    def display
        @board.each do |row|
            p row
        end     
    end

    def win?(sym)
         if diagonal_win?(sym) || vertical_win?(sym) || horizontal_win?(sym)
            puts "YOU WIN!!!!!"
        return true
         end
        false
    end

    def lose?
        @board.each do |array|
             if array.none? {|el| el == "_"}
            puts "YOU LOSE!!!!!!!"
            return true
        end
        end
        false
    end

    def diagonal_win?(sym)
        return true if left_to_right(sym) || right_to_left(sym)
        false
    end

    def left_to_right(sym)
        count = 0
        @board.each_with_index do |row, i1|
            row.each_with_index do |col, i2|
                if i1 == i2 && @board[i1][i2] == sym
                    count += 1
                end
            end
        end
        return true if count == @board.length
        false
    end

    def right_to_left(sym)
        flipped_array = []
        @board.each {|el| flipped_array << el.reverse}
        count = 0
        flipped_array.each_with_index do |row, i1|
            row.each_with_index do |col, i2|
                if i1 == i2 && flipped_array[i1][i2] == sym
                    count += 1
                end
            end
        end
        return true if count == @board.length
        false
    end

    def vertical_win?(sym)
        transposed_array = @board.transpose
        transposed_array.each do |array|
            return true if array.all? {|el| el == sym}
        end
        false
    end

    def horizontal_win?(sym)
        @board.each do |row|
            return true if row.all? {|el| el == sym}
        end
        false
    end

    def legal_position?(pos)
        if @board[pos[0]][pos[1]] != "_" || @board[pos[0]][pos[1]] == nil
            return false
        end
        true
    end
end

game = Board.new
p game.players