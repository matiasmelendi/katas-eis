class BattleshipPlayer

  def shoot_to_position position, board
    unless board.empty_position?(position)
      board.destroy_ship_at_position(position)
      Hint.new
    end
  end
end