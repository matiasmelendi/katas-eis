require 'matrix'
require_relative 'matrix'

class BattleshipBoard

  def self.new_with_dimension width, height
    new width, height
  end

  def initialize width, height
    @board = Matrix.build(width, height) {|row, column| 0}
  end

  def columns
    @board.column_vectors
  end

  def rows
    @board.row_vectors
  end

  def add_small_ship_at_position ship, position
    put_ship_on ship, position
  end

  def add_large_ship_at_position ship, position
    put_ship_on ship, position
    put_ship_on ship, (next_column_from position)
  end

  def empty_position? position
   ship_at_position(position) == 0
  end

  def ship_at_position position
    @board.element(position[0], position[1])
  end

  private
  def put_ship_on ship, position
    @board[ position[0], position[1] ] = ship
  end

  def next_column_from position
    position[1] = position[1] + 1
    position
  end
end