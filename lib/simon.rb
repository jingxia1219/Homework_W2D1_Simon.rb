class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until self.game_over
    take_turn
    system("clear")
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless @game_over
    round_success_message
    self.sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      sleep 0.75
      system("clear")
      sleep 0.25
    end
  end

  def require_sequence
      puts "repeat the colors you saw in the correct order by
      putting in the first letter of the color:"
      @seq.each do |color|
         user_input = gets.chomp
         if color[0] != user_input
           self.game_over = true
           break
         end
       end
       sleep(0.25)
  end

  def add_random_color
     self.seq << COLORS.sample
  end

  def round_success_message
    puts "Good job!"
  end

  def game_over_message
      puts "Game Over!"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end

game = Simon.new
game.play
