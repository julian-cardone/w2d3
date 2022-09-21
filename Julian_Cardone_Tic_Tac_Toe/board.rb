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

    def print
        @grid.each {|arr| p arr}
    end

    def win_row?(mark)
        @grid.each {|arr| return true if arr.count(mark) == 3}
        false
    end

    def win_col?(mark)
        @grid.transpose.each {|arr| return true if arr.count(mark) == 3}
        false
    end

    def win_diagonal?(mark)
        count = 0
        @grid.each_with_index do |arr, i|
            arr.each_with_index do |ele, j|
                if i == j && @grid[i][j] == mark
                    count += 1
                end
            end
        end
        return true if count == 3
        count2 = 0
        @grid.each_with_index do |arr, i|
            arr.reverse.each_with_index do |ele, j|
                if i == j && @grid[i][j] == mark
                    count2 += 1
                end
            end
        end
        return true if count == 3 || count2 = 3
        false
    end

end