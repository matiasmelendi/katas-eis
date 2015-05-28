require_relative 'shoot_result'
require_relative 'water'

class Sink < ShootResult

  def self.can_handle? used_positions
    used_positions == 1
  end

  def update_board_at_position board, position
    board.at_put(position, Water.new)
    itself
  end

  def sink?
    true
  end

  def to_s
    "Sink"
  end

end