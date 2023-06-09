require './person_class'

class Student < Person
  attr_reader :classroom

  def initialize(age, name = 'unknown', id = Random.rand(1..1000))
    super(age, name, id)
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.add_students(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
