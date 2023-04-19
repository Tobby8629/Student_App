require './person_class'
class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, age, name = 'unknown', id = Random.rand(1..1000))
    super(age, name, id)
    @specialization = specialization
  end

  def can_use_service
    true
  end
end
