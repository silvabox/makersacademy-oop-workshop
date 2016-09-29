require 'spec_helper'
require 'student'

describe Student do
  let(:data) do
    {
      'first_name' => 'Sandrine',
      'last_name' => 'Ortiz',
      'date_of_birth' => '18/06/1987',
      'height' =>  152
    }
  end

  subject(:student) { Student.new(data) }

  it 'must be initialized with data' do
    expect{Student.new}.to raise_error ArgumentError
  end

  it 'has a first name' do
    expect(student.first_name).to eq data['first_name']
  end

  it 'has a last name' do
    expect(student.last_name).to eq data['last_name']
  end

  it 'has a date of birth' do
    expect(student.date_of_birth).to eq Date.parse(data['date_of_birth'])
  end

  it 'has a height' do
    expect(student.height).to eq data['height']
  end

  it 'has a full name' do
    expect(student.full_name).to eq "#{data['first_name']} #{data['last_name']}"
  end

  it 'has a rating' do
    expect(student.rating).to eq 12
  end
end
