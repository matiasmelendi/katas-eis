require 'spec_helper'

describe TennisScoreBoard do

  let!(:player_one) { TennisPlayer.new }
  let!(:player_two) { TennisPlayer.new }

  let!(:score_board) { TennisScoreBoard.new player_one, player_two }

  it "should start in 0-0 sets" do
    expect(score_board.sets).to eq [0, 0]
  end

  it "should start in 0-0 games" do
    expect(score_board.games).to eq [0, 0]
  end

  it "should start in 0-0 points" do
    expect(score_board.points).to eq [0, 0]
  end

  context "when points are 40-40" do

    let!(:score_p1) { TennisScoreTest.new ThirtyPoints.new }
    let!(:score_p2) { TennisScoreTest.new FortyPoints.new  }

    let!(:test_player_1) { TestPlayer.new score_p1 }
    let!(:test_player_2) { TestPlayer.new score_p2 }

    let!(:score_board) { TennisScoreBoard.new test_player_1, test_player_2 }

    before :each do
      score_board.player_one_scored
    end

    it "should reset the points scores" do
      expect(score_board.match_state).to be Deuce
    end

  end

end