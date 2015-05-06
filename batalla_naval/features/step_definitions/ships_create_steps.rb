Given(/^a board with dimensions "(.*?)" x "(.*?)"$/) do |columns, rows|
  @board = BattleshipBoard.new_with_dimension(rows.to_i, columns.to_i)
end

Given(/^I create a small ship in position "(.*?)"$/) do |arg1|
  @small_ship = SmallShip.new
  @position = arg1.split(':').join.to_i

  @board.add_ship_in_position @small_ship, @position
end

Then(/^position "(.*?)" is not empty$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end
