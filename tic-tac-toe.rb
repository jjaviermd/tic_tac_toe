class Board
  attr_reader :board, :player_x, :player_o, :player
  attr_writer :player

  def initialize
    @board = Array.new(3){Array.new(3, " ")} 
    @player_x = "x"
    @player_o = "o"
    @player = player_x
  end
  
  def print_board
    puts "1=2=3"
    board.each do |row| 
      puts row.join("I")
      puts "====="
    end
    game_over if game_over?
  end

  def play(input_row, input_colum)
    board[input_row][input_colum] = player
    print_board
    switch_player unless game_over?
  end

  def switch_player
    if player == player_x
      @player = player_o
    else
      @player = player_x
    end
    puts "Now is player #{player.upcase}'s turn!"
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

  def game_over?
    board.reject{|row|row.include?(" ")}.any?{ |row| row == ([row.first] * row.count)}
  end

  def game_over
    puts "GAME OVER! Player #{player.upcase} won!"
  end
end

my_board =  Board.new
my_board.box_select

# ex_arr = [['x', ' ', ' '],['x', ' ', ' '],['x', '', ' ']]
# ex_arr[0].intersection(ex_arr[1], ex_arr[2])