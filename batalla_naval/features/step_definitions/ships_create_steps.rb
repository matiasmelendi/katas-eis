Given(/^a board with dimensions "(.*?)" x "(.*?)"$/) do |columns, rows|
  @board = BattleshipBoard.new_with_dimension(rows.to_i, columns.to_i)
end