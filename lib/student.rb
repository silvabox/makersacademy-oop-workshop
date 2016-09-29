require 'date'

class Student
  attr_reader :first_name, :last_name, :date_of_birth, :height

  def initialize(data)
    @first_name = data['first_name']
    @last_name = data['last_name']
    @date_of_birth = Date.parse(data['date_of_birth'])
    @height = data['height']
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def rating
    letters_in_name = full_name.scan(/\w/).count
    year_of_birth / (height + letters_in_name)
  end

  private

  def year_of_birth
    date_of_birth.year
  end
end
