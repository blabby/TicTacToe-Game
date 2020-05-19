class Computer
    attr_reader :name, :sym, :ai
    def initialize(name, sym)
        @name = name
        @sym = sym
        @ai = true
    end
end