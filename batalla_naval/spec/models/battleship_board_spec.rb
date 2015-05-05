require_relative '../../app/models/battleship_board'

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