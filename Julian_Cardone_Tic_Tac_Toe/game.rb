require_relative './board.rb'
require_relative './HumanPlayer.rb'
require 'byebug'

class Game

    def initialize(n, *mark_values)
        @players = []
        mark_values.each {|mark| @players << HumanPlayer.new(mark)}
        @current_player = @players[0]
        @grid = Board.new(n)
    end

    def switch_turn
        @current_player = @players.rotate![0]
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