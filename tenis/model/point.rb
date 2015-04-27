require_relative 'subclass_resposability'

class Point

  def value
    raise SubclassResponsability
  end

  def next
    raise SubclassResponsability
  end

end

class ZeroPoints < Point
  def value
    0
  end

  def next
    FifteenPoints.new
  end

end

class FifteenPoints < Point
  def value
    15
  end

  def next
    ThirtyPoints.new
  end

end

class ThirtyPoints < Point
  def value
    30
  end

  def next
    FortyPoints.new
  end


end

class FortyPoints < Point
  def value
    40
  end

  def next
    ZeroPoints.new
  end

end