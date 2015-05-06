class ShootResult

  def self.for_a_ship_in_a_board ship, board
    used_positions = 0
    board.collect { |e,r,c| used_positions+=1 if e.equal?(ship)  }

    result = subclasses.detect{ |sr| sr.can_handle? used_positions }
    result.new
  end

  def self.subclasses
    [Water, Sink, Hit]
  end

  def self.can_handle? used_positions
    false
  end

  def water?
    false
  end

  def hit?
    false
  end

  def sink?
    false
  end

end