Given(/^a board with dimensions "(.*?)" x "(.*?)"$/) do |columns, rows|
  @board = BattleshipBoard.new_with_dimension(rows.to_i, columns.to_i)
end

Given(/^I create a small ship in position "(.*?)"$/) do |pos|
  @small_ship = SmallShip.new
  position = pos.split(':').join.to_i

  @board.add_ship_in_position @small_ship, position
end

Then(/^position "(.*?)" is not empty$/) do |pos|
  position = pos.split(':').join.to_i

  expect(@board.empty_position? position).to be_falsey
end
