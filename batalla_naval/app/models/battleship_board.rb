require 'matrix'
require_relative 'water'
require_relative 'sink'
require_relative 'hit'

class BattleshipBoard

  def self.new_with_dimension width, height
    new width, height
  end

  def initialize width, height
    @board = Matrix.build(width, height) {|row, column| Water.new}
  end

  def positions
    create_positions_for columns.size, rows.size
  end

  def columns
    @board.column_vectors
  end

  def rows
    @board.row_vectors
  end

  def add_small_ship_at_position ship, position
    at_put position, ship
  end

  def add_large_ship_at_position ship, position
    at_put position, ship
    at_put (next_column_from position), ship
  end

  def empty_position? position
   ship_at_position(position).instance_of?(Water)
  end

  def ship_at_position position
    @board.element(position[0], position[1])
  end

  def shoot_to_ship_at_position(position)
    if empty_position?(position)
      Water.new
    else
      ship = ship_at_position position
      shoot_result_for_ship = shoot_result_for ship
      shoot_result_for_ship.update_board_at_position(self, position)
    end
  end

  def at_put position, ship
    row = position[0]
    col = position[1]

    @board[row, col] = ship
  end

  private
  def shoot_result_for ship
    ShootResult.for_a_ship_in_a_board(ship, @board)
  end

  def next_column_from position
    row = position[0]
    col = position[1] + 1

    [row, col]
  end

  def create_positions_for rows_size, columns_size
    @positions = []
    (0..columns_size - 1).each do |col|
      (0..rows_size - 1).each do |row|
        @positions.push("#{col}:#{row}")
      end
    end

    @positions
  end

end

#MonkeyPatch to allow me to use an assignment method
class Matrix
  def []=(i, j, v)
    @rows[i][j] = v
  end
end