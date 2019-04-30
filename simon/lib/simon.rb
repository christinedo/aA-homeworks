class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @seq = []
    @game_over = false
  end

  def play
    puts "You will be shown a sequence of colors."
    sleep(1)
    system("clear")
    
    take_turn until game_over

    system("clear")

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    if !game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    seq.each do |color|
      puts color
      sleep(0.8)
      system("clear")
      sleep(0.2)
    end
  end

  def require_sequence
    puts "Repeat the sequence by typing the first letter of each color on a new line: "
    seq.each do |color|
      user_seq = gets.chomp
      if user_seq != color[0]
        @game_over = true
        break # End the game as soon as a wrong answer is typed.
      end
    end
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "Get ready for the next round!"
    sleep(0.8)
    system("clear")
  end

  def game_over_message
    puts "GAME OVER!! You won #{sequence_length - 1} rounds."
  end

  def reset_game
    @sequence_length = 1
    @seq = []
    @game_over = false
  end
end

s = Simon.new
s.play