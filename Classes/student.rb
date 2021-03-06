require_relative 'person'

class Student < Person
  attr_accessor :parent_permission
  attr_reader :classroom

  def initialize(age, name, classroom = 'Unknown', id = -1, parent_permission: true)
    super(age, name, id, parent_permission: true)
    @classroom = classroom
    @parent_permission = parent_permission
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end
end
