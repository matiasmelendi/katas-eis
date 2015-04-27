require_relative 'tennis_score'

class TennisPlayer

  attr_reader :name

  def initialize name
    @name = name
    @score = TennisScore.new
  end

  def score
    @score.score
  end

  def points
    @score.points
  end

  def games
    @score.games
  end

  def total_score
    @score
  end
end