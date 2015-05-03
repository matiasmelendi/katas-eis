require_relative '../../app/models/battleship_board'

describe "new_with_dimension" do

  it "should create a new board with a particular dimension" do
    expect(BattleshipBoard).to respond_to :new_with_dimension
  end

end