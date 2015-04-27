class TennisScoreBoard

  attr_accessor :match_state
  attr_accessor :player_one
  attr_accessor :player_two


  def initialize player_one, player_two
    @player_one = player_one
    @player_two = player_two
    @match_state = CommonGame.new_for self
  end

  def player_one_scored
    a_player_scored player_one
  end

  def player_two_scored
    a_player_scored player_two
  end

  def sets
    @match_state.sets
  end

  def games
    @match_state.games
  end

  def points
    @match_state.points
  end

  def recalculate_match_state
    @match_state = MatchState.state_for self
  end

  def safe_player_scored player
    player.score
    recalculate_match_state
  end

  def reset_points
    player_one.points_reset
    player_two.points_reset
  end

  def reset_games
    player_one.games_reset
    player_two.games_reset
  end

  def match_finished?
    @match_state.finished?
  end

  private

  def a_player_scored player
    @match_state.a_player_scored player
    recalculate_match_state
  end

end