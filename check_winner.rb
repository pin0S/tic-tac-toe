def check_winner(grid)
    grid.each do |row|
        if (row.compact.length == 3) && (row.uniq.length == 1)
            return true
        end
    end

    grid.transpose.each do |row|
        if (row.compact.length == 3) && (row.uniq.length == 1)
            return true
        end
    end

    row = [
        grid[0][0], grid[1][1], grid[2][2]
    ]
    if (row.compact.length == 3) && (row.uniq.length == 1)
        return true
    end

    row = [
        grid[0][2], grid[1][1], grid[2][0]
    ]
    if (row.compact.length == 3) && (row.uniq.length == 1)
        return true
    end

    nil
end