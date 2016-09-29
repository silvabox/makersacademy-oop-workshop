require 'date'
require 'yaml'
require_relative 'student'

students = YAML.load_file('students.yml')
students.map! { |hash| Student.new(hash) }

def rating_for_student(full_name, year_of_birth, height)
  letters_in_name = full_name.scan(/\w/).count
  year_of_birth / (height + letters_in_name)
end

students.sort! do |a, b|
  rating_a = rating_for_student(a.full_name, a.date_of_birth.year, a.height)
  rating_b = rating_for_student(b.full_name, b.date_of_birth.year, b.height)

  rating_a <=> rating_b
end

students.each do |student|
  rating = rating_for_student(student.full_name, student.date_of_birth.year, student.height)

  puts "#{student.full_name}, rating: #{rating}"
end
