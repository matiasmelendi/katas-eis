require_relative 'shoot_result'

class Water < ShootResult

  def self.can_handle? used_positions
    used_positions <= 1
  end

  def water?
    true
  end

end