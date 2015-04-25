require 'spec_helper'

describe TennisScoreBoard do

  let!(:score_board) { TennisScoreBoard.new }

  it "should start in 0-0 sets" do
    expect(score_board.scores[:sets]).to eq [0, 0]
  end

  it "should start in 0-0 games" do
    expect(score_board.scores[:games]).to eq [0, 0]
  end

  it "should start in 0-0 points" do
    expect(score_board.scores[:points]).to eq [0, 0]
  end

end