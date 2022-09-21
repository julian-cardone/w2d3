require 'byebug'

class Board

    def initialize
        @grid = Array.new(3) {Array.new(3, '_')}
    end

    def valid?(pos)
        return true if (pos[0] <= 2 && pos[1] <=2) && (pos[0] >= 0 && pos[1] >= 0)
        false
    end

    def empty?(pos)
        row = pos[0]
        collumn = pos[1]
        @grid[row][collumn] == '_'
    end

    def place_mark(pos, mark)
        unless self.empty?(pos) && self.valid?(pos)
             raise ArgumentError.new "Enter a different position"
        end
        row = pos[0]
        collumn = pos[1]
        @grid[row][collumn] = mark
    end

end