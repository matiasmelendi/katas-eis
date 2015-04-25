require 'spec_helper'

describe TennisScoreBoard do

  let!(:score_board) { TennisScoreBoard.new }

  it "should start in 0-0" do
    expect(score_board.scores).to eq [0, 0]
  end

end