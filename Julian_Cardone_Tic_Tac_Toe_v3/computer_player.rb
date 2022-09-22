class ComputerPlayer

    def initialize(mark_value)
        @mark = mark_value
    end

    attr_reader :mark

    def get_position(legal_positions)
        puts "Computer mark is: #{self.mark}"

        pos = legal_positions.shuffle[0]
        puts "Computer chose #{pos}"
        return pos
    end

end