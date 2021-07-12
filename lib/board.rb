class Board

    attr_reader :size

    def initialize(number)
        @grid = Array.new(number) {Array.new(number, :N)}
        @size = number*number
    end

    def [](array)
        @grid[array[0]][array[1]]
    end

    def []=(position, value)
        @grid[position[0]][position[1]] = value
    end

    def num_ships
        @grid.flatten.count(:S)
    end

    def attack(position)
        if self[position] == :S
            self[position] = :H
            p "you sunk my battleship"
            return true
        else
            self[position] = :X
            return false
        end
    end

    def place_random_ships
        max = 0.25 * @size
        while self.num_ships < max
            row = rand(0...@grid.length)
            col = rand(0...@grid.length)
            position = [row, col]
            self[position] = :S
        end
    end

    def hidden_ships_grid
        hidden_grid = Array.new(@grid.length) {Array.new(@grid.length)}
        @grid.each.with_index do |subarr, si|
            subarr.each.with_index do |ele, ei|
                if ele == :S
                    hidden_grid[si][ei] = :N 
                else
                    hidden_grid[si][ei] = ele
                end
            end
        end 
        hidden_grid
    end

    def self.print_grid(agrid)
        agrid.each do |subarr|
            puts subarr.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end
end
