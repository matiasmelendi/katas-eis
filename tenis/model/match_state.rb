require_relative 'subclass_resposability'

class MatchState

  attr_reader :points
  attr_reader :games

  def initialize tennis_score_board
    @tennis_score_board = tennis_score_board
    @points = [@tennis_score_board.player_one.points, @tennis_score_board.player_two.points]
    @games = [@tennis_score_board.player_one.games, @tennis_score_board.player_two.games]
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

  private

  def self.subclasses
    [Deuce, CommonGame]
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