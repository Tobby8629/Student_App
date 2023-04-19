require 'json'

def load_rental
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
