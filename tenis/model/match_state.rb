require_relative 'subclass_resposability'

class MatchState < Object

  def self.state_for tennis_score_board
    subclasses.detect { |ms| ms.is_state_of? tennis_score_board }
  end

  def self.is_state_of? tennis_score_board
    raise SubclassResponsability
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

end

class CommonGame < MatchState

  def self.is_state_of? tennis_score_board
    not tennis_score_board.points == [40, 40]
  end

end