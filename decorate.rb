class Nameable
  def correct_name
    raise notImplementedError
  end
end

class Base < Nameable
  attr_accessor :nameable

  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < Base
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < Base
  def correct_name
    @nameable.correct_name.slice(0, 11)
  end
end
