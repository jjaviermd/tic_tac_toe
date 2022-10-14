class Board
  attr_reader :board, :player_x, :player_o, :player
  attr_writer :player, :turns

  def initialize
    @board = Array.new(3){Array.new(3, " ")} 
    @player_x = "x"
    @player_o = "o"
    @player = player_x
    @turns = 0
  end
  
  def print_board
    puts "1=2=3"
    board.each do |row| 
      puts row.join("I")
      puts "====="
    end
   end

  def play(input_row, input_colum)
    board[input_row][input_colum] = player
    print_board
    @turns += 1
    game_over if game_over?(input_row, input_colum)
    switch_player unless game_over?(input_row, input_colum)
  end

  def switch_player
    if player == player_x
      @player = player_o
    else
      @player = player_x
    end
    puts "Now is player #{player.upcase}'s turn"
    player
    box_select
  end

  def box_select
    puts "inser two digits. Both 1 to 3"
    #add restriction for number ouside range o nonnumbers
    input = gets.chomp
    puts "You selected #{input}"
    input_row = input[0].to_i-1
    input_colum = input[1].to_i-1
    play(input_row, input_colum)
  end

  def game_over? (row, col)
    return true if board.reject{|row|row.include?(" ")}.any?{ |row| row == ([row.first] * row.count)}
  
    return true if board[0][col] == board[1][col] && board[0][col] == board[2][col]
    
    if row == col
      return true if board[0][0] == board[1][1] && board[1][1] == board[2][2]

    elsif col == 2 - row
      return true if board[0][2] == board[1][1] && board[1][1] == board[2][0]
    end
  false
  end

  def game_over
    puts "GAME OVER! Player #{player.upcase} won! in only #{@turns} turns"
  end
end

my_board =  Board.new
my_board.print_board
my_board.box_select