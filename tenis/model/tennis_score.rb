class TennisScore

  attr_reader :sets

  def initialize
    @points = ZeroPoints.new
    @games = ZeroGames.new
    @sets = 0
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

end