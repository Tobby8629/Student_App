require 'json'

def load_people
  File.open('./data/people.json', 'r') do |file|
    data = file.read
    return false unless data != ''

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
