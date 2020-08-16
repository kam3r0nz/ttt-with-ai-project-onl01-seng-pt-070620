class Board
    attr_accessor :cells

    @cells = []

    def reset!
        self.cells = Array.new(9, " ")
    end

    def initialize
        self.cells = Array.new(9, " ")
    end

    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def position(input)
        self.cells[input.to_i - 1]
    end

    def full?
        self.cells.all?{|spot| spot != " "}
    end

    def turn_count
        @cells.count{|spot| spot == "X" || spot == "O"}
    end

    def taken?(spot)
        self.cells[spot.to_i - 1] == "X" || self.cells[spot.to_i - 1] == "O"
    end

    def valid_move?(spot)
        !taken?(spot) && spot.to_i > 0 && spot.to_i <= 9
    end

    def update(spot, player)
        self.cells[spot.to_i - 1] = player.token
    end
end