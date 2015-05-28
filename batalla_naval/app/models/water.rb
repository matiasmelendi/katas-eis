require_relative 'shoot_result'

class Water < ShootResult

  def self.can_handle? used_positions
    used_positions == 0
  end

  def update_board_at_position board, position
    itself
  end

  def water?
    true
  end

  def to_s
    "Water"
  end
end