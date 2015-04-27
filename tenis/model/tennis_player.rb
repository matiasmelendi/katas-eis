require_relative 'tennis_score'

class TennisPlayer

  def initialize
    @score = TennisScore.new
  end

  def score
    @score.score
  end

  def points
    @score.points
  end

  def total_score
    @score
  end
end