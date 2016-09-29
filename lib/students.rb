require 'date'
require 'yaml'
require_relative 'student'

students = YAML.load_file('students.yml')
students.map! { |hash| Student.new(hash) }


students.sort! do |a, b|
  a.rating <=> b.rating
end

students.each do |student|
  puts "#{student.full_name}, rating: #{student.rating}"
end
