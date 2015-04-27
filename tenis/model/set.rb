require_relative 'subclass_resposability'
require_relative 'match_finished_exception'

class Set

  def value
    raise SubclassResponsability
  end

  def next
    raise SubclassResponsability
  end

end

class ZeroSets #< Set

  def value
    0
  end

  def next
    OneSet.new
  end

end

class OneSet < Set

  def value
    1
  end

  def next
    TwoSets.new
  end

end

class TwoSets < Set

  def value
    2
  end

  def next
    MatchFinished.new
  end

end

class MatchFinished

  def value
    "Match finished!"
  end

  def next
    raise MatchFinishedException
  end
end