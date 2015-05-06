Given(/^a large ship in position: “(\d+):(\d+)”$/) do |row, col|
  @large_ship = LargeShip.new
  position = [row.to_i, col.to_i]

  @board.add_large_ship_at_position @large_ship, position
end

Given(/^I shoot to position “(\d+):(\d+)”$/) do |row, col|
  position = [row.to_i, col.to_i]
  @player = BattleshipPlayer.new

  @result = @player.shoot_to_position position, @board
end

Then(/^I get hit$/) do
  expect(@result.hint?).to be_truthy
end
