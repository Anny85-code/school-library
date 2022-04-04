require_relative 'person'

class Student < Person
  attr_accessor :classroom
  def initialize(name = "Unknown", age, parent_permission: false, classroom: true )
    super(name, age, parent_permission: true)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
