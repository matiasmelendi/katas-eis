class TestPlayer < TennisPlayer

  def initialize name, score
    super name
    @score = score
  end

end

class TennisScoreTest < TennisScore

  def initialize points, games = ZeroGames.new, sets = OneSet.new
    @points = points
    @games = games
    @sets = sets
  end

end

class TestTennisScoreBoard < TennisScoreBoard

  def initialize player_one, player_two
    super player_one, player_two
    @match_state = MatchState.state_for self
  end

end