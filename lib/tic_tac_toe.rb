require 'pry'
class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2], 
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
    ]

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
  
  def move(index, current_player)
    @board[index] = current_player
  end  
  
  def position_taken?(user_input)
    @board[user_input] == "X" || @board[user_input] == "O"
  end
  
  def valid_move?(index)
    index.between?(0,8) == !position_taken?(index)
  end

  def turn_count
    @board.count {|token| token == "X" || token == "O"}
  end

  def current_player
    if turn_count.even? 
      "X" 
    else 
        "O"
    end  
  end

  def turn
    puts "Welcome, take a number 1-9:"
    user_input = gets.chomp     
    index = input_to_index(user_input) 
    if valid_move?(index) 
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
  #     WIN_COMBINATIONS.find do |win_combo|
  #   @board[win_combo[6]] == @board[win_combo[7]] && @board[win_combo[7]] == @board[win_combo[8]] && position_taken?(win_combo[7])
  #   end 
  # end
    WIN_COMBINATIONS.find do |win_combo|
    @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[1]] == @board[win_combo[2]] && position_taken?(win_combo[1])
    end 
  end

  def full?
    if @board.include?(" ") || @board.include?(" ")
      false
    else
      true
    end
  end

  def draw?
    if !won? && full? 
      true
    end
  end
  # true if the board is full & has not been won
  # false, if the board is won
  # false if the board is neither won nor full
  
  def over?
    puts "Is it over?"
    if won? || full? || draw?
      true
    else
      false
    puts  "No, keep going."
    end
  end

  def winner
    WIN_COMBINATIONS.find do |win_combo|
      if @board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X" 
          return "X"
      elsif
        @board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O" 
          return "O"
      else
        nil
      end
      end
    end

  def play
    
    until over?
      turn
    end
    
    if winner   #won? or winner in this case
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat's Game!"
    end
  end

  #   if winner 
  #     puts "Congratulations #{winner}!"
  #   elsif won?
  #     puts "Congratulations #{winner}"
  #   else draw?
  #     puts "Cat's Game!"
  #   end
  # end
end  





