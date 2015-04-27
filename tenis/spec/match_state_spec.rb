require_relative 'spec_helper'

describe MatchState do

  let(:test_player_1) { TestPlayer.new "test_player_1", score_p1 }
  let(:test_player_2) { TestPlayer.new "test_player_2", score_p2 }

  let(:a_tennis_score_board) { TennisScoreBoard.new test_player_1, test_player_2 }

  describe "state_for" do

    context "when score board points are 40-40" do

      let(:score_p1) { TennisScoreTest.new FortyPoints.new }
      let(:score_p2) { TennisScoreTest.new FortyPoints.new  }

      it "should return Deuce" do
        expect(MatchState.state_for a_tennis_score_board).to be_instance_of Deuce
      end

    end

    context "when score board points are Advantage for a player" do

      let(:score_p1) { TennisScoreTest.new FortyPoints.new }
      let(:score_p2) { TennisScoreTest.new FortyPoints.new  }

      before :each do
        a_tennis_score_board.recalculate_match_state
        a_tennis_score_board.player_one_scored
      end

      it "should return Deuce" do
        expect(MatchState.state_for a_tennis_score_board).to be_instance_of Deuce
      end

    end

    context "when score board points are not 40-40" do

      let(:score_p1) { TennisScoreTest.new FortyPoints.new }
      let(:score_p2) { TennisScoreTest.new ThirtyPoints.new  }

      it "should return CommonGame" do
        expect(MatchState.state_for a_tennis_score_board).to be_instance_of CommonGame
      end

    end

  end

end

describe Deuce do

  let(:score_p1) { TennisScoreTest.new FortyPoints.new }
  let(:score_p2) { TennisScoreTest.new FortyPoints.new  }

  let(:test_player_1) { TestPlayer.new "test_player_1", score_p1 }
  let(:test_player_2) { TestPlayer.new "test_player_2", score_p2 }

  let(:a_tennis_score_board) { TennisScoreBoard.new test_player_1, test_player_2 }

  describe "#a_player_scored" do

    let(:deuce) { MatchState.state_for a_tennis_score_board }

    before :each do
      deuce.a_player_scored test_player_1
    end

    it "should have an advantage" do
      expect(deuce.points).to eq "Advantage for test_player_1"
    end

  end

end


describe CommonGame do

  let(:score_p1) { TennisScoreTest.new ThirtyPoints.new }
  let(:score_p2) { TennisScoreTest.new FortyPoints.new  }
  let(:test_player_1) { TestPlayer.new "test_player_1", score_p1 }
  let(:test_player_2) { TestPlayer.new "test_player_2", score_p2 }

  let(:a_tennis_score_board) { TennisScoreBoard.new test_player_1, test_player_2 }

  describe "#a_player_scored" do

    let!(:common_game) { MatchState.state_for a_tennis_score_board }

    before :each do
      a_tennis_score_board.player_one_scored
    end

    it "should return 40-40 points" do
      expect(a_tennis_score_board.points).to eq [40, 40]
    end

    it "should be a deuce" do
      expect(a_tennis_score_board.match_state).to be_instance_of Deuce
    end

  end

end