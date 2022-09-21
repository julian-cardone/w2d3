class Player

    def get_move
        puts "enter a position with coordinates separated with a space like `4 7`"
        nums = gets.chomp
        return [nums[0].to_i, nums[2].to_i]
    end

end
