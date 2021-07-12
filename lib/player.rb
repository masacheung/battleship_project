class Player
    def get_move
        puts "enter a position with coordinates separated with a space like '4 7'"
        user = gets.chomp
        first = user[0].to_i
        last = user[-1].to_i
        array = [first, last]
    end
end
