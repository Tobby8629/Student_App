require_relative '../book'
require_relative '../classroom'
require_relative '../decorate'
require_relative '../person_class'
require_relative '../rental'

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
end

describe 'decorator' do
  before :each do
    @person = Person.new(22, 'oluwatobiloba')
  end
  it 'change name to capitalize' do
    @capitalize = CapitalizeDecorator.new(@person)
    expect(@capitalize.correct_name).to eq('Oluwatobiloba')
  end
  it 'change name to capitalize' do
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
end
