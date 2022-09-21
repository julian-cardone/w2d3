require_relative './board.rb'
require_relative './HumanPlayer.rb'
require 'byebug'

class Game

    def initialize(n, mark_value1, mark_value2)
        @player_one = HumanPlayer.new(mark_value1)
        @player_two = HumanPlayer.new(mark_value2)
        @current_player = @player_one
        @grid = Board.new(n)
    end

    def switch_turn
        if @current_player == @player_one
            @current_player = @player_two
        else
            @current_player = @player_one
        end
    end

    def play
        while @grid.empty_positions?
            @grid.print
            @grid.place_mark(@current_player.get_position, @current_player.mark)
            if @grid.win?(@current_player.mark)
                return "victory! #{@current_player.mark} wins!"
            else 
                self.switch_turn
            end
        end
        return "Draw!"
    end

end