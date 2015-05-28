def position_from string
  string.split(':').map{|n| n.to_i }
end

Given(/^a board with dimensions "(.*?)" x "(.*?)"$/) do |columns, rows|
  visit "/"
  fill_in "columns", with: columns
  fill_in "rows", with: rows
  click_button "Create Board"
end

Given(/^I create a small ship in position "(.*?)"$/) do |pos|
  @small_ship = SmallShip.new
  position = position_from pos

  @board.add_small_ship_at_position @small_ship, position
end

Then(/^position "(.*?)" is not empty$/) do |pos|
  position = position_from pos

  expect(@board.empty_position? position).to be_falsey
end

Given(/^I create a large ship in position "(.*?)"$/) do |pos|
  @large_ship = LargeShip.new
  position = position_from pos

  @board.add_large_ship_at_position @large_ship, position
end

