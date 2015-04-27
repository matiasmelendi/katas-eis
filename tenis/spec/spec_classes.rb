class TestPlayer < TennisPlayer

  def initialize name, score
    super name
    @score = score
  end

end

class TennisScoreTest < TennisScore

  def initialize points
    @points = points
    @games = ZeroGames.new
  end

end