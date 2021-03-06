require 'spec_helper'

describe TennisScoreBoard do

  let!(:player_one) { TennisPlayer.new "player_one"}
  let!(:player_two) { TennisPlayer.new "player_two"}

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

  describe "when players score" do

    let(:test_player_1) { TestPlayer.new "test_player_1", score_p1 }
    let(:test_player_2) { TestPlayer.new "test_player_2", score_p2 }

    let(:score_board) { TestTennisScoreBoard.new test_player_1, test_player_2 }


    context "when player wins a set" do

      let(:score_p1) { TennisScoreTest.new ThirtyPoints.new, OneGame.new }
      let(:score_p2) { TennisScoreTest.new FortyPoints.new, FiveGames.new  }

      before :each do
        score_board.player_two_scored
      end

      it "should reset games" do
        expect(score_board.games).to eq [0, 0]
      end

      it "should reset points" do
        expect(score_board.points).to eq [0, 0]
      end

    end

    context "when player wins a game" do

      let(:score_p1) { TennisScoreTest.new ThirtyPoints.new }
      let(:score_p2) { TennisScoreTest.new FortyPoints.new  }

      before :each do
        score_board.player_two_scored
      end

      it "should win a game" do
        expect(score_board.games).to eq [0, 1]
      end

      it "should reset points" do
        expect(score_board.points).to eq [0, 0]
      end
    end

    context "when a player wins the match " do

      let(:score_p1) { TennisScoreTest.new ThirtyPoints.new, OneGame.new, ZeroSets.new }
      let(:score_p2) { TennisScoreTest.new FortyPoints.new, FiveGames.new, OneSet.new  }

      before :each do
        score_board.player_two_scored
      end

      it "should wins the match" do
        expect(score_board.match_finished?).to be_truthy
      end

    end

    context "when points are 40-40" do

      let(:score_p1) { TennisScoreTest.new FortyPoints.new }
      let(:score_p2) { TennisScoreTest.new FortyPoints.new  }

      it "should reset the points scores" do
        expect(score_board.match_state).to be_instance_of Deuce
      end

    end

  end

end