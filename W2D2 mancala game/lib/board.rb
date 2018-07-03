class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14){Array.new}
    place_stones
    # @player1 = Player.new(name1, 1)  ##why do we need to do this????
    # @player2 = Player.new(name2, 2)
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, i|
      unless i == 6 || i ==13
        cup<< :stone
        cup<< :stone
        cup<< :stone
        cup<< :stone
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos<0 || start_pos>13
    raise "Starting cup is empty" if @cups[start_pos] == []
  end

  def make_move(start_pos, current_player_name)
    stone_hold = @cups[start_pos].size

    if current_player_name == @name1
      my_stone_idx = 6
      op_stone_idx = 13
    else
      op_stone_idx, my_stone_idx = 6, 13
    end
    @cups[start_pos] = []

    stone_hold.times do |i|
        start_pos += 1

        if (start_pos)%14 == op_stone_idx
          start_pos += 1
        end
        @cups[(start_pos)%14] << :stone
    end
    render
    next_turn(start_pos)
    if (start_pos)%14 == my_stone_idx
      return :prompt
    elsif @cups[(start_pos)%14].size == 1
      return :switch
    elsif @cups[(start_pos)%14] != []
      return (start_pos)%14
    end
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx

  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0...6].all?{|el| el.empty?} || @cups[7...13].all?{|el| el.empty?}
  end

  def winner
    return :draw if self.cups[6].size == self.cups[13].size
    if self.cups[6].size > self.cups[13].size
      return @name1
    else
      return @@name2
    end
  end
end
