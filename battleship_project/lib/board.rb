require 'byebug'

class Board

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n*n
    end

    attr_reader :size

    def [](array)
        row = array[0]
        collumn = array[1]
        return @grid[row][collumn]
    end

    def []=(array, value)
        row = array[0]
        collumn = array[1]
        @grid[row][collumn] = value
    end 

    def num_ships
        @grid.flatten.count {|ele| ele == :S}
    end

    

end
