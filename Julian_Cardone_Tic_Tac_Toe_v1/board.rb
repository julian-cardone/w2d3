require 'byebug'

class Board

    def initialize()
        @grid = Array.new(3) {Array.new(3, '_')}
    end

    def valid?(pos)
        return true if (pos[0] <= @grid.length - 1 && pos[1] <= @grid.length - 1) && (pos[0] >= 0 && pos[1] >= 0)
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
        @grid.each {|arr| return true if arr.count(mark) == @grid.length}
        false
    end

    def win_col?(mark)
        @grid.transpose.each {|arr| return true if arr.count(mark) == @grid.length}
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
        count2 = 0
        @grid.each_with_index do |arr, i|
            arr.reverse.each_with_index do |ele, j|
                if i == j && arr.reverse[j] == mark
                    count2 += 1
                end
            end
        end
        return true if count == @grid.length || count2 == @grid.length
        false
    end

    def win?(mark)
        if self.win_row?(mark) || self.win_col?(mark) || self.win_diagonal?(mark)
        return true
        end
        false
    end

    def empty_positions?
        @grid.any? {|arr| arr.include?("_")}
    end

end