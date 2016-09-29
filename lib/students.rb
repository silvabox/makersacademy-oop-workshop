require 'date'

students = [
  {
    first_name: 'Sandrine',
    last_name: 'Ortiz',
    date_of_birth: '18/06/1987',
    height: 152,
  },
  {
    first_name: 'Kennith',
    last_name: 'Dibbert',
    date_of_birth: '12/03/1972',
    height: 184,
  },
  {
    first_name: 'Laverne',
    last_name: 'Rowe',
    date_of_birth: '09/01/1992',
    height: 167,
  },
  {
    first_name: 'Lloyd',
    last_name: 'Marquardt',
    date_of_birth: '17/11/1959',
    height: 176,
  },
  {
    first_name: 'Mariano',
    last_name: 'Weber',
    date_of_birth: '31/10/1979',
    height: 160,
  }
]


def full_name(first_name, last_name)
  "#{first_name} #{last_name}"
end

def rating_for_student(full_name, year_of_birth, height)
  letters_in_name = full_name.scan(/\w/).count
  year_of_birth / (height + letters_in_name)
end

students.sort! do |a, b|
  full_name_a = full_name(a[:first_name], a[:last_name])
  full_name_b = full_name(b[:first_name], b[:last_name])
  year_of_birth_a = Date.parse(a[:date_of_birth]).year
  year_of_birth_b = Date.parse(b[:date_of_birth]).year

  rating_a = rating_for_student(full_name_a, year_of_birth_a, a[:height])
  rating_b = rating_for_student(full_name_b, year_of_birth_b, b[:height])

  rating_a <=> rating_b
end

students.each do |hash|
  full_name = full_name(hash[:first_name], hash[:last_name])
  year_of_birth = Date.parse(hash[:date_of_birth]).year
  rating = rating_for_student(full_name, year_of_birth, hash[:height])

  puts "#{full_name}, rating: #{rating}"
end
