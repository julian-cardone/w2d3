class HumanPlayer

    def initialize(mark_value)
        @mark = mark_value
    end

    attr_reader :mark

    def get_position(legal_positions)
        puts "Your mark is: #{self.mark}"
        puts "Enter two numbers with a space between them. note: top left corner = 1 1"
        
        begin
            pos = gets.chomp
            row = pos[0].to_i - 1
            col = pos[2].to_i - 1
            raise puts "Please Enter an available position in the correct format :)" if !legal_positions.include?([row, col])
            rescue
                retry
        end
        return [row, col]
    end

end