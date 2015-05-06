require 'matrix'
require_relative 'matrix'

class BattleshipBoard

  def self.new_with_dimension width, height
    new width, height
  end

  def initialize width, height
    @board = Matrix.build(width, height) {|row, column| nil}
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
   ship_at_position(position).nil?
  end

  def ship_at_position position
    @board.element(position[0], position[1])
  end

  def shoot_to_ship_at_position(position)
    at_put(position, nil) unless empty_position?(position)
  end

  private
  def at_put position, ship
    row = position[0]
    col = position[1]

    @board[row, col] = ship
  end

  def next_column_from position
    row = position[0]
    col = position[1] + 1

    [row, col]
  end
end