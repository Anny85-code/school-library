class Classroom
 attr_accessor :label, :students
 def initialize(label)
  @label = label
  end

  def add_student(student)
   @student = student
   student.owner
  end
end