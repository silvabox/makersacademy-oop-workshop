require 'date'

class Student
  def initialize(data)
    @first_name = data['first_name']
    @last_name = data['last_name']
    @date_of_birth = Date.parse(data['date_of_birth'])
    @height = data['height']
  end

  def rating
    letters_in_name = full_name.scan(/\w/).count
    year_of_birth / (height + letters_in_name)
  end

  def <=>(other)
    rating <=> other.rating
  end

  def to_s
    "#{full_name}, rating: #{rating}"
  end

  private

  attr_reader :first_name, :last_name, :date_of_birth, :height

  def full_name
    "#{first_name} #{last_name}"
  end

  def year_of_birth
    date_of_birth.year
  end
end
