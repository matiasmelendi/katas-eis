require_relative 'shoot_result'

class Sink < ShootResult

  def self.can_handle? used_positions
    used_positions > 1
  end

  def sink?
    true
  end

end