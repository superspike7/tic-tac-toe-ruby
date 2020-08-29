module TicTacToe

  def draw_board(board)
    puts "| #{board[0]} | #{board[1]} | #{board[2]} |"
    puts "___________"
    puts "| #{board[3]} | #{board[4]} | #{board[5]} |"
    puts "___________"
    puts "| #{board[6]} | #{board[7]} | #{board[8]} |"
    puts "___________"
  end



  def pattern?(board, player)

    valid_patterns = [board[0], board[1], board[2]],
                     [board[3], board[4], board[5]],
                     [board[6], board[7], board[8]],
                     [board[0], board[3], board[6]],
                     [board[1], board[4], board[7]],
                     [board[2], board[5], board[8]],
                     [board[0], board[4], board[8]],
                     [board[2], board[4], board[6]]

  valid_patterns.any? { |pattern| pattern.all? { |slot| slot == "#{player}"} }

  end

  def none_left?(board)
    board.none?(Integer)
  end

end

class Game
 include TicTacToe

  @@board = [1, 2, 3, 4, 5, 6, 7, 8, 9,] # 9 slot board

  def player_move
    puts "your move, pick between 1 - 9:"
    move = gets.chomp.to_i 
    if move <= 9 && move >= 1 && @@board[move - 1] != "X" && @@board[move - 1] != "O"
    @@board[move - 1] = 'O'
    else
      puts "You move, please pick an empty slot"
      player_move
    end
  end

  def ai_move
    random = Random.new.rand(8)
    if @@board[random] != "X" && @@board[random] != "O"
    @@board[random] = "X"
    puts "ai choosed #{random + 1}"
    else 
      ai_move
    end
  end

  def show_board
    draw_board(@@board)
  end

  def check_winner
    human_player = 'O'
    ai_player = 'X'

    if pattern?(@@board, human_player)
      puts "You win! Congrats!"
      true
    elsif pattern?(@@board, ai_player)
      puts "ai wins!, better luck next time :D"
      true
    elsif none_left?(@@board)
        puts "it's a tie!"
        true
    end
  end

end

new_game = Game.new



until new_game.check_winner
  new_game.show_board
  new_game.player_move
  begin
  new_game.ai_move
  rescue SystemStackError
    puts "no moves left"
    new_game.check_winner
    break
    end

end

new_game.show_board











