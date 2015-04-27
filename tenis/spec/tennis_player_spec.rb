require 'spec_helper'

describe TennisPlayer do

  let!(:player) { TennisPlayer.new "player" }

  context "when score ones" do

    before :each do
      player.score
    end

    it "should have 0 sets, 0 games and 15 points" do
      expect(player.points).to eq 15
    end

  end

end