require './Classes/student'
require './Classes/classroom'

describe Student do
  context 'when instantiated' do
    it 'with age, name, classroom, id and parent_permission it should create a student' do
      classroom = Classroom.new('Ruby')
      student = Student.new(20, 'Marco', classroom, 77, parent_permission: true)
      expect(student.class).to eq Student
      expect(student.name).to eq 'Marco'
      expect(student.age).to eq 20
      expect(student.classroom).to eq classroom
      expect(student.id).to eq 77
      expect(student.parent_permission).to be_truthy
    end

    it 'without classroom, id and parent_permission it should create a student with default parameters' do
      student = Student.new(20, 'Marco')
      expect(student.classroom).to eq 'Unknown'
      expect(student.id).to be_between(1, 1000)
      expect(student.parent_permission).to be_truthy
    end
  end

  context 'when calling play_hooky method' do
    it 'it should return "¯\(ツ)/¯"' do
      student = Student.new(20, 'Marco')
      expect(student.play_hooky).to eq "¯\(ツ)/¯"
    end
  end

  context 'when calling classroom method' do
    it 'it should assign the classroom to the student' do
      student = Student.new(20, 'Marco')
      classroom = Classroom.new('Ruby')
      student.classroom = classroom
      expect(student.classroom).to eq classroom
    end
  end
end
