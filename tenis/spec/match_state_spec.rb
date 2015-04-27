require_relative 'spec_helper'

describe MatchState do

  describe "state_for" do

    let(:test_player_1) { TestPlayer.new score_p1 }
    let(:test_player_2) { TestPlayer.new score_p2 }

    let(:a_tennis_score_board) { TennisScoreBoard.new test_player_1, test_player_2 }

    context "when score board points are 40-40" do

      let(:score_p1) { TennisScoreTest.new FortyPoints.new }
      let(:score_p2) { TennisScoreTest.new FortyPoints.new  }

      it "should return Deuce" do
        expect(MatchState.state_for a_tennis_score_board).to be Deuce
      end

    end

    context "when score board points are not 40-40" do

      let(:score_p1) { TennisScoreTest.new FortyPoints.new }
      let(:score_p2) { TennisScoreTest.new ThirtyPoints.new  }

      it "should return CommonGame" do
        expect(MatchState.state_for a_tennis_score_board).to be CommonGame
      end

    end

  end

end