class Game
    attr_accessor :board, :player_1, :player_2, :input
    
    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [6,4,2]
    ]
    
    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @board = board
        @player_1 = player_1
        @player_2 = player_2
    end

    def current_player
        @board.turn_count % 2 == 0 ? player_1 : player_2
    end

    def won?
        WIN_COMBINATIONS.detect do |combo|
            if (@board.cells[combo[0]]) == "X" && (@board.cells[combo[1]]) == "X" && (@board.cells[combo[2]]) == "X"
                combo
            elsif (@board.cells[combo[0]]) == "O" && (@board.cells[combo[1]]) == "O" && (@board.cells[combo[2]]) == "O"
                combo
            else
                false
            end
        end
    end

    def draw?
        @board.full? && !won?
    end

    def over?
        won? || draw?
    end

    def winner
        if won?
            @board.cells[won?[0]] == "X" ? "X" : "O"
        else
            nil
        end
    end

    def turn
        puts "Pick a position between 1 and 9:"
        @input = current_player.move(@board)
        if @board.valid_move?(@input)
            @board.update(@input, current_player)
        else puts "Pick a position between 1 and 9:"
            @board.display
            turn
        end
        @board.display
    end

    def play
        while over? == false
          turn
        end
        if won?
          puts "Congratulations #{winner}!"
        elsif draw?
          puts "Cat's Game!"
        end
    end
end