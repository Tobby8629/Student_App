require './app'

@main = Main.new

def menu
  my_lambda = lambda {
    puts 'welcome to school library!'
    puts ' '
    puts 'please choose an option by entering a number:'
    puts '1 - list all books'
    puts '2 - list all people'
    puts '3 - create a person'
    puts '4 - create a book'
    puts '5 - create a rental'
    puts '6 - list all rentals for a given person id'
    puts '7 - Exit'
  }
  my_lambda.call
  gets.chomp
end

loop do
  input = menu
  case input
  when '1'
    @main.show_book
  when '2'
    @main.show_people
  when '3'
    @main.create_person
  when '4'
    @main.create_book
  when '5'
    @main.rental
  when '6'
    @main.list_rental
  when '7'
    puts 'thank you for using the school library'
    break
  else
    puts 'input valid number, choose a number between 1-7'
  end
end
