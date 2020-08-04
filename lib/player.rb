class Player
    attr_reader :name, :sym, :ai
    def initialize(name, sym)
        @name = name
        @sym = sym
        @ai = false
    end
end
