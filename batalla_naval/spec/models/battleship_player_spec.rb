require_relative '../../app/models/battleship_player'

describe BattleshipPlayer do

  it "should can shoot to a ship inside the board" do
    player = BattleshipPlayer.new

    expect(player).to respond_to :shoot_to_position
  end

end