require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(name, age, parent_permission: true)
    @classroom = classroom
    @parent_permission = parent_permission
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

