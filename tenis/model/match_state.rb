require_relative 'subclass_resposability'

class MatchState

  attr_reader :points
  attr_reader :games
  attr_reader :sets

  def initialize tennis_score_board
    @tennis_score_board = tennis_score_board
    @points = [@tennis_score_board.player_one.points, @tennis_score_board.player_two.points]
    @games = [@tennis_score_board.player_one.games, @tennis_score_board.player_two.games]
    @sets = [@tennis_score_board.player_one.sets, @tennis_score_board.player_two.sets]
  end

  def self.state_for tennis_score_board
    subclasses.detect { |ms| ms.is_state_of? tennis_score_board }.new_for tennis_score_board
  end

  def self.is_state_of? tennis_score_board
    raise SubclassResponsability
  end

  def self.new_for tennis_score_board
    new tennis_score_board
  end

  def finished?
    false
  end

  private

  def self.subclasses
    [Finished, Deuce, WithWinningPossibility, CommonGame]
  end

end

class Deuce < MatchState

  def self.is_state_of? tennis_score_board
    tennis_score_board.points == [40, 40]
  end

  def a_player_scored a_player
    @points = Advantage.new_for(a_player).value
  end

end

class CommonGame < MatchState

  def self.is_state_of? tennis_score_board
    not tennis_score_board.points == [40, 40]
  end

  def a_player_scored a_player
    @tennis_score_board.safe_player_scored a_player
  end

end

class WithWinningPossibility < MatchState

  def initialize tennis_score_board
    super
    @winning_rules = self.class.winning_rules.select {|rule| rule.is_state_of? tennis_score_board}
  end

  def self.is_state_of? tennis_score_board
    winning_rules.any? {|rule| rule.is_state_of? tennis_score_board }
  end

  def a_player_scored a_player
    @winning_rules.each do |rule|
      a_rule = rule.new_for(@tennis_score_board)
      if a_rule.winning_condition_for a_player
        a_rule.a_player_scored a_player
      end
    end
  end

  private

  def self.winning_rules
    [WithWinningGamePossibility, WithWinningSetPossibility]
  end

end

class WithWinningGamePossibility < MatchState

  def self.is_state_of? tennis_score_board
    tennis_score_board.points.count(40) == 1
  end

  def a_player_scored a_player
    a_player.won_a_game
    @tennis_score_board.reset_points
  end

  def winning_condition_for a_player
    a_player.points == 40
  end

end

class WithWinningSetPossibility < MatchState

  def self.is_state_of? tennis_score_board
    tennis_score_board.games.count(5) > 0
  end

  def a_player_scored a_player
    @tennis_score_board.reset_games
    a_player.won_a_set
    @tennis_score_board.recalculate_match_state
  end

  def winning_condition_for a_player
    a_player.games == 6
  end

end

class Finished < MatchState

  def self.is_state_of? tennis_score_board
    tennis_score_board.sets.count(2) == 1
  end

  def a_player_scored a_player

  end

  def winning_condition_for a_player
    a_player.sets == 2
  end

  def finished?
    true
  end

end