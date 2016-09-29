require 'date'
require 'yaml'
require_relative 'student'

students = YAML.load_file('students.yml')
students.map! { |hash| Student.new(hash) }


students.sort.each { |student| puts student }
