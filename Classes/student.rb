require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, name = 'Unknown', classroom: true)
    super(name, age)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
