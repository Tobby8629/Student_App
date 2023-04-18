require './student_class'
require './teacher_class'

class Option
  def initialize(selection, person)
    @selection = selection
    @person = person
  end

  def check
    case @selection
    when '1'
      stu_person
    when '2'
      teacher_person
    end
  end

  def stu_person
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp.downcase
    person = Student.new(age, name)
    person.parent_permission = false if permission == 'n'
    @person.push(person)
    puts 'Person created successfully'
  end

  def teacher_person
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'specialization :'
    specialization = gets.chomp
    person = Teacher.new(specialization, age, name)
    @person.push(person)
    puts 'Person created successfully'
  end
end
