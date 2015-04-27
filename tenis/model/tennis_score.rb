class TennisScore

  attr_reader :sets

  def initialize
    @points = ZeroPoints.new
    @games = ZeroGames.new
    @sets = 0
  end

  def score
    @games = @games.next if @points.value == 40
    @points = @points.next
  end

  def points
    @points.value
  end

  def games
    @games.value
  end

end