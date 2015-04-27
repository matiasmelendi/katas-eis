class TennisScoreBoard

  attr_accessor :match_state
  attr_accessor :player_one
  attr_accessor :player_two


  def initialize player_one, player_two
    @player_one = player_one
    @player_two = player_two
    @match_state = CommonGame.new
  end

  def player_one_scored
    a_player_scored player_one
  end

  def player_two_scored
    a_player_scored player_two
  end

  def sets
    [player_one.total_score.sets, player_two.total_score.sets]
  end

  def games
    [player_one.total_score.games, player_two.total_score.games]
  end

  def points
    [player_one.points, player_two.points]
  end

  private

  def a_player_scored player
    player.score
    recalculate_match_state
  end

  def recalculate_match_state
    @match_state = MatchState.state_for self
  end

end