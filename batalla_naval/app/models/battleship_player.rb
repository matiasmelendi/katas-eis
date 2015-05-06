class BattleshipPlayer

  def shoot_to_position position, board
      board.shoot_to_ship_at_position(position)
  end
end