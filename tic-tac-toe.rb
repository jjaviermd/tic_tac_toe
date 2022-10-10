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
    #gameover? gameover: 
  end

  def play(input_row, input_colum)
    board[input_row][input_colum] = player
    print_board
    switch_player
  end

  def switch_player
    if player == player_x
      @player = player_o
    else
      @player = player_x
    end
    puts "Now is player #{player.upcase}'s turn!"
    player
  end

  def box_select
    puts "inser two digits. Both 1 to 3"
    input = gets.chomp
    puts "You selected #{input}"
    
  end

end

my_board =  Board.new
my_board.box_select
