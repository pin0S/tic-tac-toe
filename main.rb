require_relative 'check_winner'
require_relative 'check_draw'

board = [[nil, nil, nil],
        [nil, nil, nil],
        [nil, nil, nil]
        ]

puts 'Welcome to tic-tac-toe would you like to be "x" and go first or "o" and go second'
input = gets.chomp

@human = input
@computer = (@human=="x") ? "o" : "x"
@player = (@human=="x") ? 0 : 1

winner = nil
draw = nil

def print_board(grid)
    grid = grid.map do |rows|
        rows = rows.map {|element| element.nil? ? ' ' : element} 
        rows.join('|')
    end

    puts
    puts grid.join("\n" + ('-' * 5) + "\n")
    puts 
end

def player_move(grid)
    print "Player move: (row, col) "
    move = gets.chomp.split(",")
    puts ""
    row, col = move.map {|element| element.to_i}
    if grid[row][col].nil?
        grid[row][col] = @human
        @player = 1
    else
        puts "Can't play there that tile is already taken"
        player_move(grid)
    end
end

def computer_turn(grid)
    move = rand(0..2), rand(0..2)
    row, col = move.map { |element| element.to_i}
    if grid[row][col].nil?
        print "Computer move: (row, col) "
        sleep(1)
        grid[row][col] = @computer
        @player = 0  
    else
        computer_turn(grid)
    end
end

# this is called an event loop
until winner || draw
    print_board(board)
    (@player == 0) ? player_move(board) : computer_turn(board) 
    winner = check_winner(board)
    draw = is_draw?(board)
    break if winner || draw
end

if winner == true
    puts "The winner is #{@player}" 
else 
    puts "It was a draw"
end
print_board(board)

