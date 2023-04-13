require './book'
require './person_class'
require './student_class'
require './teacher_class'

class Main
  def initialize()
    @books = []
    @people = []
    @rentals = []
  end

  def show_book
    if @books == []
      puts 'data is empty! Add a book'
    else
      @books.each do |book|
        puts "title: \"#{book.title}\" author: #{book.author}"
        puts
      end
    end
  end

  def show_people
    if @people == []
      puts 'data is empty! Add a person'
    else
      @people.each do |person|
        puts "[#{person.class.name}] name: #{person.name}, age: #{person.age}, id:#{person.id}"
        puts
      end
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'book successfully created'
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [input the number]: '
    selection = gets.chomp
    check(selection)
  end

  def rental
    puts 'select a book from the following lists of book by number'
    @books.each_with_index do |book, index|
      puts " #{index})title: \"#{book.title}\" author: #{book.author}"
    end
    book = gets.chomp.to_i


    puts 'select a book from the following lists of book by number(not id)'
    @people.each_with_index do |person, index|
      puts "#{index})[#{person.class.name}] name: #{person.name}, age: #{person.age}, id:#{person.id}"
    end
    person = gets.chomp.to_i

    print 'date: '
    date = gets.chomp

    rental = Rental.new(date, @people[person], @books[book])

    @rentals.push(rental)

    puts 'Rental created successfully'
  end

  def list_rental
    print 'ID of the person: '
    id = gets.chomp.to_i
    puts 'Rental: '
    @rentals.each do |rent|
      puts "Date: #{rent.date}, Book \"#{rent.book.title}\" by #{rent.book.author}" if rent.person.id == id
    end
  end

  def check(selection)
    case selection
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
    @people.push(person)
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
    @people.push(person)
    puts 'Person created successfully'
  end
end
