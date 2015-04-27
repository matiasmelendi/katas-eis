class TennisScore

  def initialize
    @points = ZeroPoints.new
    @games = ZeroGames.new
    @sets = ZeroSets.new
  end

  def score
    @points = @points.next
  end

  def points
    @points.value
  end

  def games
    @games.value
  end

  def sets
    @sets.value
  end

  def sum_game
    @games = @games.next
  end

  def sum_set
    @sets = @sets.next
  end

  def points_reset
    @points = ZeroPoints.new
  end

  def games_reset
    @games = ZeroGames.new
  end

end