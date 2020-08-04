    require_relative "player.rb"
    require_relative "computer.rb"

class Board
    attr_reader :size, :board, :sym, :players
    def initialize
        puts "Enter game size: (Ex: 3 would give a 3x3 grid)"
        @size = gets.chomp.to_i
        @board = Array.new(@size) {Array.new(@size, "_")}
        puts "How many computer players?"
        @computer = gets.chomp.to_i
        puts "How many human players?"
        @human  = gets.chomp.to_i
        @players = []
        self.add_human_players(@human)
    end

    def run
        puts "Welcome to TicTacToe!"
        until lose?
            self.display
            puts "It is #{self.current_player.name}'s turn"
            if self.current_player.ai == false
            puts "Enter position. (EX: 0 0 for position 1 on board)"
            pos = gets.chomp.split(" ").map(&:to_i)
            while !legal_position?(pos)
                puts "Invalid position, please try again. (EX: 0 0 for position 1 on board)"
                pos = gets.chomp.split(" ").map(&:to_i)
            end
        else
            pos = self.computer_pick
            while !legal_position?(pos)
                pos = self.computer_pick
            end
        end
            self.placement(pos)
            break if win?(self.current_player.sym)
            self.switch_players
        end
        self.display
        if win?(self.current_player.sym)
        puts "#{self.current_player.name} WINS!!!!!!!"
        else
            puts "NO ONE WINS!"
        end
        puts "GAME OVER!"
    end

    def computer_pick
        guess_array = []
        possible_pos = (0...@board.length).to_a
        2.times {guess_array << possible_pos.sample}
        guess_array
    end

    def add_human_players(n)
        (1..n).each do |player|
            puts "Enter player #{player}'s' name"
            name = gets.chomp
            puts "Enter player #{player}'s symbol"
            symbol = gets.chomp.to_sym
            players << Player.new(name, symbol)
        end
        self.add_computer_players(@computer)
    end

    def add_computer_players(n)
        (1..n).each do |player|
            puts "Enter computer #{player}'s' name"
            name = gets.chomp
            puts "Enter computer #{player}'s symbol"
            symbol = gets.chomp.to_sym
            players << Computer.new(name, symbol)
        end
        self.run
    end

    def current_player
        @players.first
    end

    def switch_players
        hold = @players.pop
        @players.unshift(hold)
    end

    def placement(pos)
        @board[pos[0]][pos[1]] = self.current_player.sym
    end

    def display
        @board.each do |row|
            p row
        end     
    end

    def win?(sym)
         if diagonal_win?(sym) || vertical_win?(sym) || horizontal_win?(sym)
        return true
         end
        false
    end

    def lose?
        counter = []
        @board.each do |array|
            counter += array
        end
        return true if counter.none? {|el| el == "_"}
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

if __FILE__== $PROGRAM_NAME
    Board.new

    continue = true
while continue
puts "Play again? (Y/N)"
answer = gets.chomp.upcase
if answer == "Y"
    Board.new
else
    continue = false
end
end
end



