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

  find("option[value='Small Ship']").click
  find("option[value='#{pos}']").click
  click_button "Add Ship"
end

Then(/^position "(.*?)" is not empty$/) do |pos|
  pending
end

Given(/^I create a large ship in position "(.*?)"$/) do |pos|
  @large_ship = LargeShip.new
  position = position_from pos

  @board.add_large_ship_at_position @large_ship, position
end

