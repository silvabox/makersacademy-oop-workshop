require 'date'
require 'yaml'
require_relative 'student'

students = YAML.load_file('students.yml')
students.map! { |hash| Student.new(hash) }

def full_name(first_name, last_name)
  "#{first_name} #{last_name}"
end

def rating_for_student(full_name, year_of_birth, height)
  letters_in_name = full_name.scan(/\w/).count
  year_of_birth / (height + letters_in_name)
end

students.sort! do |a, b|
  full_name_a = full_name(a.first_name, a.last_name)
  full_name_b = full_name(b.first_name, b.last_name)

  rating_a = rating_for_student(full_name_a, a.date_of_birth.year, a.height)
  rating_b = rating_for_student(full_name_b, b.date_of_birth.year, b.height)

  rating_a <=> rating_b
end

students.each do |student|
  full_name = full_name(student.first_name, student.last_name)
  rating = rating_for_student(full_name, student.date_of_birth.year, student.height)

  puts "#{full_name}, rating: #{rating}"
end
