require_relative 'shoot_result'

class Hit < ShootResult

  def self.can_handle? used_positions
    used_positions > 1
  end

  def update_board_at_position board, position
    board.at_put(position, self)
    itself
  end

  def hit?
    true
  end

  def to_s
    "Hit"
  end
end