class HumanPlayer

    def initialize(mark_value)
        @mark = mark_value
    end

    attr_reader :mark

    def get_position
        puts "Your mark is: #{self.mark}"
        puts "Enter two numbers with a space between them. note: top left corner = 1 1"
        pos = gets.chomp

        pos_split = pos.split(" ")
        unless pos_split.length == 2 && ((pos_split[0].to_i).is_a?(Integer) && pos_split[0].to_i > 0)  && ((pos_split[1].to_i).is_a?(Integer) && pos_split[1].to_i > 0)
            raise ArgumentError.new "Please Enter using the correct format :)"
        end

        row = pos[0].to_i - 1
        col = pos[2].to_i - 1
        return [row, col]
    end




end