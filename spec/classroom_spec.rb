require './Classes/student'
require './Classes/classroom'

describe Classroom do
  context 'when instantiated' do
    it 'with label should create a classroom' do
      classroom = Classroom.new('Java')
      expect(classroom.class).to eq Classroom
      expect(classroom.label).to eq 'Java'
    end
  end

  context 'when calling add_student method' do
    it 'with student object should add student to classroom' do
      student = Student.new(20, 'Marco')
      classroom = Classroom.new('Ruby')
      classroom.add_student(student)
      expect(classroom.students.length).to be >= 1
      expect(student.classroom).to eq classroom
    end
  end
end
