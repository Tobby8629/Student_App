require './person_class'

class Student < Person
  attr_reader :classroom

  def initialize(age, name = 'unknown')
    super(age, name)
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.add_students(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
