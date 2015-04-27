require 'spec_helper'

describe TennisScore do

  let!(:tennis_score) { TennisScore.new }

  describe "score" do

    before :each do
      tennis_score.score
    end

    it "should increment score points" do
      expect(tennis_score.points).to eq 15
    end

  end

  describe "points" do

    it "should return 0" do
      expect(tennis_score.points).to eq 0
    end

  end

  describe "games" do

    it "should return 0" do
      expect(tennis_score.games).to eq 0
    end

  end

  describe "sets" do

    it "should return 0" do
      expect(tennis_score.sets).to eq 0
    end

  end

end