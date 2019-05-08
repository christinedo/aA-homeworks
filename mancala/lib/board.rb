class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }

    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_index do |i|
      unless i == 6 || i == 13
        @cups[i] = [:stone, :stone, :stone, :stone]
      end
    end
  end

  def valid_move?(start_pos)
    if start_pos >= cups.length
      raise "Invalid starting cup"
    elsif cups[start_pos].empty?
      raise "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
    stones_to_distribute = cups[start_pos].length
    cups[start_pos] = []

    current = start_pos + 1
    until stones_to_distribute.zero?
      current_cup = current % 14
      if (current_cup != 13 && current_player_name == @name1) || (current_cup != 6 && current_player_name == @name2)
        cups[current_cup] << :stone
        stones_to_distribute -= 1
      end
      current += 1
    end
    render
    next_turn(current_cup)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if cups[ending_cup_idx].one? && (ending_cup_idx != 13 && ending_cup_idx != 6)
      return :switch
    elsif cups[ending_cup_idx].length > 1
      return ending_cup_idx
    else
      return :prompt
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    player1_side = (0...6).all? { |i| cups[i].empty? }
    player2_side = (7..12).all? { |i| cups[i].empty? }

    player1_side || player2_side
  end

  def winner
    if cups[6].length > cups[13].length
      return @name1
    elsif cups[13].length > cups[6].length
      return @name2
    else
      return :draw
    end
  end
end
