require './person_class'
class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, age, name = 'unknown')
    super(age, name)
    @specialization = specialization
  end

  def can_use_service
    true
  end
end
