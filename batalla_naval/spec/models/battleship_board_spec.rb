require_relative '../../app/models/battleship_board'
require_relative '../../app/models/small_ship'
require_relative '../../app/models/large_ship'

describe "new_with_dimension" do

  it "should create a new board with a particular dimension" do
    expect(BattleshipBoard).to respond_to :new_with_dimension
  end

  it "should create a board with 5 columns and 5 rows " do
    battleship_board = BattleshipBoard.new_with_dimension 5, 5

    expect(battleship_board.columns.size).to eq 5
    expect(battleship_board.rows.size).to eq 5
  end

end

describe "add_small_ship_at_position" do

  it "should change the position status" do
    battleship_board = BattleshipBoard.new_with_dimension 5, 5
    ship = SmallShip.new
    position = [2, 2]

    battleship_board.add_small_ship_at_position ship, position

    expect(battleship_board.empty_position? position).to be_falsey
  end

  it "should have the ship at the position" do
    battleship_board = BattleshipBoard.new_with_dimension 5, 5
    ship = SmallShip.new
    position = [2, 2]

    battleship_board.add_small_ship_at_position ship, position

    expect(battleship_board.ship_at_position position).to eq ship
  end

end

describe "add_large_ship_at_position" do

  it "should have the large ship at position and the next position" do
    battleship_board = BattleshipBoard.new_with_dimension 5, 5
    ship = LargeShip.new
    position = [2, 2]
    next_position = [2, 3]

    battleship_board.add_large_ship_at_position ship, position

    expect(battleship_board.ship_at_position position).to eq ship
    expect(battleship_board.ship_at_position next_position).to eq ship
  end
end

describe "destroy_ship_at_position" do

  it "should leave the position empty if it's a small ship" do
    battleship_board = BattleshipBoard.new_with_dimension 5, 5
    ship = SmallShip.new
    position = [2, 2]
    battleship_board.add_small_ship_at_position ship, position

    expect(battleship_board.empty_position? position).to be_falsey

    battleship_board.shoot_to_ship_at_position position

    expect(battleship_board.empty_position? position).to be_truthy
  end

  it "should leave the position with a sink and not modify next position if it's a large ship" do
    battleship_board = BattleshipBoard.new_with_dimension 5, 5
    ship = LargeShip.new
    position = [2, 2]
    next_position = [2, 3]

    battleship_board.add_large_ship_at_position ship, position

    battleship_board.shoot_to_ship_at_position position

    expect(battleship_board.ship_at_position position).to be_instance_of Sink
    expect(battleship_board.empty_position? next_position).to be_falsey
  end

end