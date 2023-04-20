require_relative '../book'
require_relative '../classroom'
require_relative '../decorate'
require_relative '../person_class'
require_relative '../rental'
require_relative '../student_class'
require_relative '../teacher_class'

describe Book do
  before :each do
    @book = Book.new('All girls are the same', 'Tobby')
  end

  describe '#addnew' do
    it 'takes the two parameter' do
      expect(@book).to be_an_instance_of Book
    end
  end

  describe 'check value of title and author' do
    it 'value of title' do
      expect(@book.title).to eq('All girls are the same')
    end

    it 'value of author' do
      expect(@book.author).to eq('Tobby')
    end
  end

  describe 'check the add rental method' do
    it 'should have the rental instance' do
      date = '22/22/22'
      person = Person.new(22, 'Tobby')
      puts @book.add_rentals(date, person)
      expect(@book.add_rentals(date, person)).to be_an_instance_of Rental
    end
  end
end

describe 'decorator' do
  before :each do
    @person = Person.new(22, 'oluwatobiloba')
  end
  it 'raises a NotImplementedError' do
    @nameable = Nameable.new
    expect { @nameable.correct_name }.to raise_error(NotImplementedError)
  end
  it 'change name to capitalize' do
    @capitalize = CapitalizeDecorator.new(@person)
    expect(@capitalize.correct_name).to eq('Oluwatobiloba')
  end
  it 'change name to trimmer' do
    trimmer = TrimmerDecorator.new(@person)
    expect(trimmer.correct_name).to eq('oluwatobilo')
  end
end

describe Rental do
  it 'should have an instance of Rental' do
    book = Book.new('All girls are the same', 'Tobby')
    person = Person.new(22, 'oluwatobiloba')
    @rental = Rental.new('22/22/22', person, book)
    expect(@rental).to be_an_instance_of Rental
  end
end

describe Person do
  before :each do
    @person = Person.new(17, 'Tobby')
  end

  it 'should be instance of person' do
    expect(@person).to be_an_instance_of Person
  end

  it 'should return false' do
    expect(@person.send(:of_age?)).to eq(false)
  end
  describe 'test for use service' do
    it 'should return false' do
      @person.parent_permission = false
      expect(@person.can_use_service?).to eq(nil)
    end
    it 'should return true' do
      @person.parent_permission = true
      expect(@person.can_use_service?).to eq(true)
    end
    it 'should return true' do
      @person.age = 20
      expect(@person.can_use_service?).to eq(true)
    end
  end
end

describe Student do
  before :each do
    @student = Student.new(25, 'Tobby')
  end

  it 'should be an instance Student' do
    expect(@student).to be_an_instance_of Student
  end

  it 'should return ¯(ツ)/¯' do
    expect(@student.play_hooky).to eq('¯(ツ)/¯')
  end

  it 'add student to the class array' do
    sclass = Classroom.new(300)
    @student.classroom = (sclass)
    expect(sclass.students).to eq([@student])
  end
end

describe Teacher do
  teacher = Teacher.new('medicine', 25, 'Tobby')
  it 'should be an instance Teacher' do
    expect(teacher).to be_an_instance_of Teacher
  end
  it 'should be an instance Teacher' do
    expect(teacher.can_use_service).to eq(true)
  end
end

describe Classroom do
  classroom = Classroom.new(200)
  it 'should be an instance Classroom' do
    expect(classroom).to be_an_instance_of Classroom
  end
  it 'should return student class label' do
    student = Student.new(25, 'Tobby')
    classroom.add_students(student)
    room = student.classroom.label
    expect(room).to eq(200)
  end
end
