class BattleshipPlayer

  def shoot_to_position position, board
    unless board.empty_position?(position)
      board.shoot_to_ship_at_position(position)
      Hint.new
    end
  end
end