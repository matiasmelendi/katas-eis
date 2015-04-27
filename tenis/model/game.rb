require_relative 'subclass_resposability'

class Game

  def value
    raise SubclassResponsability
  end

  def next
    raise SubclassResponsability
  end

end

class ZeroGames < Game

  def value
    0
  end

  def next
    OneGame.new
  end


end

class OneGame < Game

  def value
    1
  end

  def next
    TwoGames.new
  end


end

class TwoGames < Game

  def value
    2
  end

  def next
    ThreeGames.new
  end


end

class ThreeGames < Game

  def value
    3
  end

  def next
    FourGames.new
  end

end

class FourGames < Game

  def value
    4
  end

  def next
    FiveGames.new
  end

end

class FiveGames < Game

  def value
    5
  end

  def next
    SixGames.new
  end

end

class SixGames < Game

  def value
    6
  end

  def next
    ZeroGames.new
  end

end