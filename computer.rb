class Computer
    attr_reader :placer
    def initialize(name, sym)
        @name = name
        @sym = sym
        @ai = true
    end
end