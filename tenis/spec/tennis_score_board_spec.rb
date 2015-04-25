require 'spec_helper'

describe TennisScoreBoard do

  let!(:score_board) { TennisScoreBoard.new }

  it "should start in 0-0 sets" do
    expect(score_board.scores[:sets]).to eq [0, 0]
  end



end