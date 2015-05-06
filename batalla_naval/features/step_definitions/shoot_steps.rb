Given(/^a large ship in position: “(\d+):(\d+)”$/) do |row, col|
  @large_ship = LargeShip.new
  position = [row.to_i, col.to_i]

  @board.add_large_ship_at_position @large_ship, position
end
