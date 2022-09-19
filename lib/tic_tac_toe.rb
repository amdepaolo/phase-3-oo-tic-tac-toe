class TicTacToe

    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

    def initialize
        @board = [" "," "," "," "," "," "," "," "," "]
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end 

    def input_to_index(input)
        input.to_i - 1
    end

    def move(index, token='X')
        @board[index] = token
    end

    def position_taken?(index)
        @board[index] == 'X' || @board[index] == 'O'
    end

    def valid_move?(index)
        if index > 8 || index < 0
            return false
        end
        !position_taken?(index)
    end

    def turn_count
        @board.length - @board.tally[" "]
    end

    def current_player
        turn_count.even? ? "X" : "O"
    end

    def turn
        puts "Choose your next move?"
        choice = gets 
        index = input_to_index(choice)
        if valid_move?(index)
            move(index, current_player)
            display_board
        else
            turn
        end
    end

    def won?
        WIN_COMBINATIONS.find{|array| array.all?{|i| @board[i] =="X"} || array.all?{|i| @board[i] =="O"}}
    end

    def full?
        !@board.include?(" ")
    end

    def draw?
        full? && !won?
    end

    def over?
        draw? || !!won?
    end

    def winner
        if won?
            winning_indices = won?
            return @board[winning_indices[0]]
        else
            nil
        end
    end

    def play
        if !over?
            turn
            play
        elsif draw?
            puts "Cat's Game!"
        else
            puts "Congratulations #{winner}!"
        end
    end

end
