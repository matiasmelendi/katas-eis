require_relative '../../app/models/battleship_board'
require_relative '../../app/models/small_ship'

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

describe "add_ship_in_position" do

  it "should change the position status" do
    battleship_board = BattleshipBoard.new_with_dimension 5, 5
    ship = SmallShip.new
    position = [2, 2]

    battleship_board.add_ship_in_position ship, position

    expect(battleship_board.empty_position? position).to be_falsey
  end

end