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

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            puts "you sunk my battleship!"
            return true
        else
            self[pos] = :X
            return false
        end
    end

    def place_random_ships
        while num_ships < (0.25 * @size)
            random = rand_coord(@size)
            self[random] = :S if self[random] != :S 
        end
    end

    def rand_coord(size)
        rand_row = rand(0..(Math.sqrt(@size)-1))
        rand_collumn = rand(0..(Math.sqrt(@size)-1))
        return [rand_row, rand_collumn]
    end

    def hidden_ships_grid
        hidden = @grid
      hidden.map do |arr|
        arr.map do |ele|
            ele = :N if ele == :S
            ele
        end
    end
    end

    def self.print_grid(array)
        array.each do |arr|
            puts arr.join(" ")
        end
    end


    def cheat()
        Board.print_grid(@grid)
    end

    def print()
        Board.print_grid(hidden_ships_grid)
    end



end
