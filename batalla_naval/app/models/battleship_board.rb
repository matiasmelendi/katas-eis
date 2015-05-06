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

  def add_ship_in_position ship, position
    @board[ position[0], position[1] ] = ship
  end

  def empty_position? position
    @board.element(position[0], position[1]).nil?
  end

  def ship_at_position position
    @board.element(position[0], position[1])
  end

end