class TicTacToe
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end 
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def move(index, player_character)
    @board[index] = player_character
  end
    
  def position_taken?(index)
   !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn_count
  counter = 0
  @board.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1
    end
  end
counter
end

def current_player
  if turn_count.even?
    return "X"
  else
    return "O"
  end
end

def turn
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end

def won?
 WIN_COMBINATIONS.each do |win_combination|
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]
 
  position_1 = @board[win_index_1] 
  position_2 = @board[win_index_2] 
  position_3 = @board[win_index_3] 
 
    if position_1 == position_2 && position_2 ==   position_3 && position_taken?(win_index_1)
    return win_combination 
    end
  end
  false
end
  

  def full?
    !@board.include?(' ')
  end

def draw?
  !won? && full? ? true : false
end

def over?
  draw? || won? 
end

def winner
  if won?
    @board[won?[0]]
  end
end

def play
  until over?
    turn
  end
  if winner == "X" || winner == "O"
    puts "Congratulations #{winner}!"
  else draw?
    puts "Cat's Game!"
  end
end

end

