require './book'
require './person_class'
require './student_class'
require './teacher_class'
require './create_person'
require 'json'

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
    run = Option.new(selection, @people)
    run.check
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

  def preserve_peopledata
    return unless @people != []

    json_data = JSON.generate(@people.map do |person|
                                if person.instance_of?(::Teacher)
                                  { name: person.name,
                                    age: person.age,
                                    id: person.id,
                                    class: person.class.name,
                                    specialization: person.specialization }
                                else
                                  {
                                    name: person.name,
                                    age: person.age,
                                    id: person.id,
                                    class: person.class.name
                                  }
                                end
                              end)
    File.write('./data/people.json', json_data)
  end

  def retrieve_peopledata
    File.open('./data/people.json', 'r') do |file|
      data = file.read
      if data != ''
        parsed_data = JSON.parse(data)
        @people = parsed_data.map do |dat|
          if dat['class'] == 'Student'
            Student.new(dat['age'], dat['name'], dat['id'])
          else
            Teacher.new(dat['specialization'], dat['age'], dat['name'], dat['id'])
          end
        end
      end
    end
  end

  def preserve_book
    return unless @books != []

    json_data = JSON.generate(@books.map do |book|
      { title: book.title, author: book.author }
    end)
    File.write('./data/book.json', json_data)
  end

  def retrieve_bookdata
    File.open('./data/book.json', 'r') do |file|
      data = file.read
      if data != ''
        parsed_data = JSON.parse(data)
        @books = parsed_data.map do |dat|
          Book.new(dat['title'], dat['author'])
        end
      end
    end
  end

  def preserve_rentalsdata
    return unless @rentals != []

    json_data = JSON.generate(@rentals.map do |rent|
      { date: rent.date,
        book: { title: rent.book.title, author: rent.book.author },
        person: { age: rent.person.age, name: rent.person.name, id: rent.person.id } }
    end)
    File.write('./data/rental.json', json_data)
  end

  def retrieve_rentaldata
    File.open('./data/rental.json', 'r') do |file|
      data = file.read
      if data != ''
        parsed_data = JSON.parse(data)
        @rentals = parsed_data.map do |dat|
          Rental.new(dat['date'], Person.new(dat['person']['age'], dat['person']['name'], dat['person']['id']),
                     Book.new(dat['book']['title'], dat['book']['author']))
        end
      end
    end
  end
end
