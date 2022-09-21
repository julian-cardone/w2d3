class ComputerPlayer

    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position(legal_positions)
        puts "Computer mark is: #{self.mark}"
        end

        pos = legal_positions.shuffle[0]
        puts "Computer chose #{pos}"
        return pos
    end

end