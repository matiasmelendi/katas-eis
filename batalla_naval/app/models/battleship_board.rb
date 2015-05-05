require 'matrix'

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

end