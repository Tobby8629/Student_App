require 'json'

def load_book
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
