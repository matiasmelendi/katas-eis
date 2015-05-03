Given(/^a board with dimensions "(.*?)" x "(.*?)"$/) do |arg1, arg2|
  @board = BattleshipBoard.new_with_dimension(5,5)
end